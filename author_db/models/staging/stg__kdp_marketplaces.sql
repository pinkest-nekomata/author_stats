select
    marketplace_url
  , marketplace
  , currency

from {{ ref('seed__kdp_marketplaces') }} as mkt
