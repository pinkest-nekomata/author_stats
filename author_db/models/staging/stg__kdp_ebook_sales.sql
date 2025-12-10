select
    "Royalty Date"      as royalty_date
  , "Title"             as title
  , "Author Name"       as author_name
  , "ASIN"              as ebook_asin
  , "Marketplace"       as marketplace
  , "Royalty Type"      as royalty_type
  , "Transaction Type"  as transaction_type
  , "Units Sold"        as num_units_sold
  , "Units Refunded"    as num_units_refunded
  , "Net Units Sold"    as net_unit_sales
  , "Avg. List Price without tax"   as avg_list_price_wo_tax
  , "Avg. Offer Price without tax"  as avg_offer_price_wo_tax
  , "Avg. File Size (MB)"           as avg_file_size_mb
  , "Avg. Delivery Cost"            as avg_delivery_cost
  , "Royalty"                       as royalty
  , "Currency"                      as currency
  , file_name   
  , file_index                    
  , {{ dbt_utils.generate_surrogate_key(['royalty_date','ebook_asin','marketplace', 'currency', 'file_name', 'file_index']) }} as ebook_sale_key

from {{ source('raw_db', 'raw__kdp_sales') }}