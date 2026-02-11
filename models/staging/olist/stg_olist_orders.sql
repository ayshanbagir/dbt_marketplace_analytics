select
  order_id,
  customer_id,
  order_status,
  nullif(order_purchase_timestamp, '')::timestamp_ntz as order_purchase_ts,
  nullif(order_approved_at, '')::timestamp_ntz as order_approved_ts,
  nullif(order_delivered_carrier_date, '')::timestamp_ntz as order_delivered_carrier_ts,
  nullif(order_delivered_customer_date, '')::timestamp_ntz as order_delivered_customer_ts,
  nullif(order_estimated_delivery_date, '')::timestamp_ntz as order_estimated_delivery_ts
from {{ source('olist', 'olist_orders') }}
