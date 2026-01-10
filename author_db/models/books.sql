select
    title      as title
  , title_code as title_code
  
  , series             as series
  , num_in_series::int as num_in_series

  , ebook_list_usd::double as ebook_list_usd
  , pprbk_list_usd::double as pprbk_list_usd
  
  , ebook_isbn::text as ebook_isbn
  , pprbk_isbn::text as pprbk_isbn
  , ebook_asin::text as ebook_asin

  , kenp::int as kenp
  
  , split_share::double as split_share --for royalty splitting. Decimal representing my share.
  
from {{ ref('seed__books') }}