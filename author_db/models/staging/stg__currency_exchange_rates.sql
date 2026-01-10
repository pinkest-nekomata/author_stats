select
    {{ dbt_utils.generate_surrogate_key(['from_cur','to_cur','effective_from']) }} as cur_hist_key
  , from_cur
  , to_cur
  , rate
  , source
  , effective_from::date as effective_from
  , effective_to::date   as effective_to

from {{ ref('seed__currency_exchange_rates') }}