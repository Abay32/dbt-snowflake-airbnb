{{
  config(
    materialized = 'incremental',
    unique_key = 'listing_id',
    )
}}

select
    listing_id,
    host_id,
    property_type,
    city,
    country,
    bedrooms,
    bathrooms,
    price_per_night,
    accommodates,
    {{ tag('price_per_night') }} as price_per_night_tag,
    created_at
from 
    {{ ref('bronze_listings') }}