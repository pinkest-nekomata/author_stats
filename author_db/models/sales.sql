select
    sale_key
  , report_date
  , date_trunc('month', report_date) as report_month
  , year(report_date) as report_year

  , sales.title_code
  , books.title
  , books.series
  , author_name

  , format
  , distributor
  {# , vendor #}
  , country

  , net_unit_sales
  , sales.kenp as kenp
  , est_borrows
  , coalesce(net_unit_sales, est_borrows) as combined_units

  , currency_code as tx_currency
  {# , cur_exchange_rate #}

  , unit_list_price_usd
  , unit_offer_price_usd
  {# , unit_offer_price_lcur #}

  , royalty_percent

  {# , gross_royalty_usd #}
  , sales_channel_share_usd
  , d2d_share_usd
  , my_share_usd
  {# , my_share_lcur #}

  , is_verified
  
  , report_source
  , export_date

from {{ ref('int__combined_sales') }} as sales

left join {{ ref('books') }} as books
  on sales.title_code = books.title_code
 
where true
 