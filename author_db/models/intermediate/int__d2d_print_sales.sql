select
    print_sale_key as sale_key
  , end_date as report_date
  , title_code
  , primary_author as author_name
  , 'PRINT' as format
  , distributor
  , vendor

  , country
  , net_unit_sales

  , currency_code
  , publisher_share_usd / publisher_share as cur_exchange_rate
    --for D2D the best source of an est exchange rate is from the
    --estimated USD royalties given

  , list_price_per_unit as unit_list_price_lcur
  , books.pprbk_list_usd as unit_list_price_usd

  , offer_price_per_unit as unit_offer_price_lcur
  , round(offer_price_per_unit * cur_exchange_rate,2) as unit_offer_price_usd

  , royalty_percent
  , sales_channel_revenue_per_unit as sales_channel_per_unit_raw

  , extended_sales_channel_revenue as gross_royalty_lcur
  , round(gross_royalty_lcur * cur_exchange_rate,2) as gross_royalty_usd

  , round(unit_offer_price_lcur * net_unit_sales - gross_royalty_lcur,2) as sales_channel_share_lcur
  , round(sales_channel_share_lcur * cur_exchange_rate,2) as sales_channel_share_usd

  , round(gross_royalty_lcur - publisher_share,2) as d2d_share_lcur
  , round(gross_royalty_usd - publisher_share_usd,2) as d2d_share_usd

  , publisher_share
  , publisher_share_usd

  , round(publisher_share * coalesce(split_share),2)     as my_share_lcur
  , round(publisher_share_usd * coalesce(split_share),2) as my_share_usd

  , is_verified
  , left(right(file_name, 14),10)::date as export_date

  , 'D2D' as report_source

from {{ ref('stg__d2d_print_sales') }} as d2d_print
left join {{ ref('books') }} as books
    on d2d_print.paperback_isbn::varchar = books.PPRBK_ISBN::varchar

where list_price_per_unit > 0 --paid only