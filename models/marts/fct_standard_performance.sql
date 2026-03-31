with combined as (
    select * from {{ ref('stg_fb_ads') }}
    union all
    select * from {{ ref('stg_google_ads') }}
)
select
    ad_date,
    platform,
    sum(costs) as total_net_costs,
    sum(clicks) as total_clicks
from combined
group by 1, 2
