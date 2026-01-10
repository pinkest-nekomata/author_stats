select
    kenp_key  as sale_key
  , kenp_date as report_date
  , books.title_code
  , kenp_days.author_name
  , 'SUBSCRIPTION' as format
  , 'Amazon' as distributor
  , kenp_days.marketplace_url as vendor --match nomenclature of D2D data

  , case when vendor = 'Amazon.com' then 'US'
                    else upper(right(vendor,2)) end as country

  , null as net_unit_sales
  , kenp_days.kenp as kenp
  , books.kenp as kenp_per_book
  , kenp_days.kenp / books.kenp as est_borrows

  , kenp_rates.kenp_rate
  , kenp_rates.kenp_rate_usd

  , kenp_rates.currency    as currency_code
  , kenp_rates.to_usd_rate as cur_exchange_rate
  
   --calculate estimated royalties
  , kenp_days.kenp * kenp_rates.kenp_rate     as gross_royalty_lcur
  , kenp_days.kenp * kenp_rates.kenp_rate_usd as gross_royalty_usd 

  , gross_royalty_usd as my_share_usd

  , false as is_preorder

  , left(right(kenp_days.file_name, 15),10)::date as export_date

  , 'KDP' as report_source

from {{ ref('stg__kdp_kenp_days') }} as kenp_days

left join {{ ref('books') }} as books
  on kenp_days.ebook_asin::varchar = books.ebook_asin::varchar

left join {{ ref('stg__kenp_rates') }} as kenp_rates
  on  date_trunc('month', kenp_days.kenp_date::date) = kenp_rates.report_month
  and kenp_days.marketplace_url = kenp_rates.marketplace_url
