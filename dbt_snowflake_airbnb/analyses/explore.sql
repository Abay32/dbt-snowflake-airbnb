--select * from {{ ref('silver_listings') }}

select count(*) from {{ ref('obt') }}