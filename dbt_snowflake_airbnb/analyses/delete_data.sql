{% set tables = ['bronze_listings', 'bronze_hosts', 'bronze_bookings'] %}

{% for table in tables %}
DELETE FROM {{ table }};
{% endfor %}