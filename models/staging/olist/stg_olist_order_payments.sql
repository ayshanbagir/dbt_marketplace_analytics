select
  order_id,
  payment_sequential,
  payment_type,
  nullif(payment_installments, '')::int as payment_installments,
  nullif(payment_value, '')::numeric(10,2) as payment_value
from {{ source('olist', 'olist_order_payments') }}
