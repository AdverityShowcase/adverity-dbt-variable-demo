select
    day as ad_date,
    campaign_name,
    costs,
    impressions,
    clicks as clicks,
    device_type as device,
    'Facebook' as platform
from {{ source('ad_data', 'ads_insights_1166') }}
