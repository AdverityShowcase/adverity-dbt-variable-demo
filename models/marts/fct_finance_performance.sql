with combined as (
    select * from {{ ref('stg_fb_ads') }}
    union all
    select * from {{ ref('stg_google_ads') }}
)
select
    ad_date,
    platform,
    sum(costs) as net_costs,
    -- Apply Tax Variable
    sum(costs) * {{ var('ad_tax_rate') }} as tax_amount,
    -- Apply Agency Fee Variable
    sum(costs) * {{ var('agency_fee_percentage') }} as agency_fees,
    -- Calculate Total Gross Costs
    (sum(costs) * (1 + {{ var('ad_tax_rate') }})) + (sum(costs) * {{ var('agency_fee_percentage') }}) as total_gross_cost
from combined
group by 1, 2
