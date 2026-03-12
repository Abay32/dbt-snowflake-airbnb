{% set flag = True%}
select * from {{ ref('bronze_bookings') }}
{% if flag %}
    where nights_booked > 1
{% else %}    
    where nights_booked = 1  
{% endif %}
