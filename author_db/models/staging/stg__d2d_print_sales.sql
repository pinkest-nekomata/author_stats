select
    "Start Date"     as start_date
  , "End Date"       as end_date
  , "Publisher"      as publisher
  , "Title ID"       as title_id
  , "Paperback ISBN" as paperback_isbn
  , "Title"          as title
  , "Primary Author" as primary_author
  , "Distributor"    as distributor
  , "Vendor"         as vendor
  , "Country"        as country
  , "Units Sold"     as units_sold
  , "Units Returned" as units_returned
  , "Net Unit Sales" as net_unit_sales
  , "Sales Model"    as sales_model
  , "Retailer"              as retailer
  , "List Price Per Unit"   as list_price_per_unit
  , "Currency Code"         as currency_code
  , "Offer Price Per Unit"  as offer_price_per_unit
  , "Royalty Percent"       as royalty_percent
  , "Unit Cost"             as unit_cost
  , "Sales Channel Revenue Per Unit"    as sales_channel_revenue_per_unit
  , "Extended Sales Channel Revenue"    as extended_sales_channel_revenue
  , "Publisher Share"                   as publisher_share
  , "Publisher Share USD (estimated)"   as publisher_share_usd
  , "Verified"                          as is_verified
  , filename                            as file_name
  , file_index
  , {{ dbt_utils.generate_surrogate_key(['start_date','paperback_isbn','vendor', 'country', 'file_name', 'file_index']) }} as print_sale_key

from {{ source('raw_db', 'raw__d2d_print_sales') }}