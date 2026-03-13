{{
  config(
    materialized = 'incremental'
    )
}}
{% set incremental_col = 'created_at' %}

select 
    * 
from 
    {{ source('staging', 'bookings') }}
{% if is_incremental() %}
   where created_at > (
        select 
            coalesce(max(created_at), '1900-01-01')
        from {{this}}
   )
{% endif %}