select
    "Date"              as kenp_date
  , "Title"             as title
  , "Author Name"       as author_name
  , "eBook ASIN"        as ebook_asin
  , "Audiobook ASIN"    as audiobook_asin
  , "Audible ASIN"      as audible_asin
  , "Marketplace"       as marketplace
  , "KENP"              as kenp
  , file_name           
  , {{ dbt_utils.generate_surrogate_key(['kenp_date','ebook_asin','marketplace']) }} as kenp_key

from {{ source('raw_db', 'raw__kdp_kenp') }}