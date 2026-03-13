{{
  config(
    materialized = 'incremental',
    unique_key = 'host_id',
    )
}}

select
    host_id,
    replace(host_name, ' ', '_') AS host_name,
    host_since,
    is_superhost,
    response_rate,
    case
        when response_rate > 95 then 'Very good'
        when response_rate <= 95 and response_rate > 80 then 'Good'
        when response_rate <= 80 and response_rate > 60 then 'Fair'
        else 'Poor'
    end as response_rate_quality,
    created_at
from 
    {{ ref('bronze_hosts') }}

