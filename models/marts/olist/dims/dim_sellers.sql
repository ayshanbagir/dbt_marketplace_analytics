{{ config(tags=['dim']) }}

select
  seller_id,
  seller_zip_code_prefix,
  seller_city,
  seller_state
from {{ ref('dim_sellers_snapshot') }}
where dbt_valid_to is null
