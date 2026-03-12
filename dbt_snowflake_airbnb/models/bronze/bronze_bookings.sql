{% set incremental_flag = 1 %}
{% set incremental_col = 'created_at' %}

select * from {{ source('staging', 'bookings') }}
{% if incremental_flag == 1 %}
    where {{ incremental_col }} > ( select coalesce(max( {{ incremental_col }} ), '1900-01-01') from {{ ref('bronze_bookings') }}  )
{% endif %}