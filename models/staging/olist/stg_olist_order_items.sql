select
  order_id,
  order_item_id,
  product_id,
  seller_id,
  nullif(shipping_limit_date, '')::timestamp_ntz as shipping_limit_date,
  nullif(price, '')::numeric(10,2) as price,
  nullif(freight_value, '')::numeric(10,2) as freight_value
from {{ source('olist', 'olist_order_items') }}
