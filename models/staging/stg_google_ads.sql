select
    day as ad_date,
    campaign_name as campaign_name,
    costs as costs,
    impressions as impressions,
    clicks as clicks,
    device_type as device,
    'Google' as platform
from {{ source('ad_data', 'google_ads_1163') }}
