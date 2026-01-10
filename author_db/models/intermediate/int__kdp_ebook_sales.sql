select
    ebook_sale_key as sale_key
  , royalty_date as report_date
  , books.title_code
  , author_name
  , 'EBOOK' as format
  , 'Amazon' as distributor
  , marketplace as vendor --match nomenclature of D2D data
  
  , case when vendor = 'Amazon.com' then 'US'
                    else upper(right(vendor,2)) end as country
  , net_unit_sales

  , currency as currency_code
  , cur.rate as cur_exchange_rate

  , avg_list_price_wo_tax as unit_list_price_lcur
  , books.ebook_list_usd  as unit_list_price_usd

  , avg_offer_price_wo_tax as unit_offer_price_lcur
  , avg_offer_price_wo_tax * cur.rate as unit_offer_price_usd

  , left(royalty_type,2)::numeric as royalty_percent

  , avg_delivery_cost as sales_channel_per_unit_raw

  , royalty as gross_royalty_lcur
  , royalty * cur.rate as gross_royalty_usd

  , round(unit_offer_price_lcur * net_unit_sales - gross_royalty_lcur,2) as sales_channel_share_lcur
  , round(sales_channel_share_lcur * cur.rate,2) as sales_channel_share_usd

  , 0 as d2d_share_lcur
  , 0 as d2d_share_usd

  , gross_royalty_lcur as my_share_lcur
  , gross_royalty_usd as my_share_usd

  , transaction_type = 'Pre Order' as is_preorder
  , left(right(file_name, 15),10)::date as export_date

  , 'KDP' as report_source

from {{ ref('stg__kdp_ebook_sales') }} as kdp_esales

left join {{ ref('books') }} as books
    on kdp_esales.ebook_asin::varchar = books.ebook_asin::varchar

left join {{ ref('stg__currency_exchange_rates') }} as cur
    on   kdp_esales.currency = cur.from_cur
    and  to_cur = 'USD'
    and  kdp_esales.royalty_date >= cur.effective_from
    and (kdp_esales.royalty_date <  cur.effective_to or cur.effective_to is null)

where avg_offer_price_wo_tax > 0 --paid only
  and net_unit_sales != 0 --ignore simple returns