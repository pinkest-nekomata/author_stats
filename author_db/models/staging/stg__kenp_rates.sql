with

date_spine as (
  select
      date_trunc('month', generate_series) as report_month
  from generate_series(date '2025-09-01', date '2030-01-01', interval 1 month)
  where generate_series < today()
),

marketplace_months as (
  select
    {{dbt_utils.generate_surrogate_key(['report_month','marketplace_url'])}} as market_month_key
  , report_month
  , marketplace_url
  , marketplace
  , currency

  from date_spine

  left join {{ ref('stg__kdp_marketplaces') }} as marketplaces
    on 1 = 1
),

latest_known_rate as (
    select 
        marketplace
      , kenp_rate
    from {{ ref('seed__kenp_rates') }}
    where is_final = true
    qualify rank() over (partition by marketplace order by report_month desc) = 1
)

select
    months.market_month_key
  , months.report_month
  , months.marketplace_url
  , months.marketplace
  , months.currency
  , cur.rate   as to_usd_rate
  , cur.source as rate_source

  , rates.kenp_rate as kenp_rate_raw
  , coalesce(rates.kenp_rate, latest.kenp_rate) as kenp_rate

  --kenp_rate * to_usd_rate = kenp_rate_usd
  , coalesce(rates.kenp_rate, latest.kenp_rate) * cur.rate as kenp_rate_usd

from marketplace_months as months

left join {{ ref('seed__kenp_rates') }} as rates
  on  months.marketplace  = rates.marketplace
  and months.report_month = rates.report_month

left join latest_known_rate as latest
  on  months.marketplace = latest.marketplace

left join {{ ref('seed__currency_exchange_rates') }} as cur
    on  months.currency = cur.from_cur
    and cur.to_cur = 'USD'
    and  months.report_month >= cur.effective_from
    and (months.report_month < cur.effective_to OR cur.effective_to is null)