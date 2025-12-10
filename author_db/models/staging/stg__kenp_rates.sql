with latest_known_rate as (
    select kenp_rate as latest_known_rate
    from {{ ref('seed__kenp_rates') }}
    where is_final = true
    qualify rank() over (order by report_month desc) = 1
)

{# select * from latest_known_rate #}

select
    report_month
  , kenp_rate as kenp_rate_raw
  , coalesce(kenp_rate_raw, latest_known_rate) as kenp_rate
  , is_final
from {{ ref('seed__kenp_rates') }}
left join latest_known_rate on 1 = 1