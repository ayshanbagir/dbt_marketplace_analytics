select
  order_id,
  customer_id,
  order_status,
  nullif(order_purchase_timestamp, '')::timestamp_ntz as order_purchase_timestamp,
  nullif(order_approved_at, '')::timestamp_ntz as order_approved_at,
  nullif(order_delivered_carrier_date, '')::timestamp_ntz as order_delivered_carrier_date,
  nullif(order_delivered_customer_date, '')::timestamp_ntz as order_delivered_customer_date,
  nullif(order_estimated_delivery_date, '')::timestamp_ntz as order_estimated_delivery_date
from {{ source('olist', 'olist_orders') }}
