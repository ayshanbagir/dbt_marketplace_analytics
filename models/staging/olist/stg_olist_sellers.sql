select
  seller_id,
  nullif(seller_zip_code_prefix, '')::int as seller_zip_code_prefix,
  seller_city,
  seller_state
from {{ source('olist', 'olist_sellers') }}
