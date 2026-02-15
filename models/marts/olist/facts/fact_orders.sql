with orders as (
  select
    order_id,
    customer_id,
    order_status,
    order_purchase_date,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    total_payment_value,
    avg_review_score
  from {{ ref('int_orders_enriched') }}
),

rollup as (
  select * from {{ ref('int_order_item_rollup') }}
)

select
  o.order_id,
  o.customer_id,

  o.order_status,
  o.order_purchase_date,
  o.order_approved_at,
  o.order_delivered_carrier_date,
  o.order_delivered_customer_date,
  o.order_estimated_delivery_date,

  coalesce(r.item_rows, 0) as item_rows,
  coalesce(r.distinct_products, 0) as distinct_products,
  coalesce(r.distinct_sellers, 0) as distinct_sellers,

  coalesce(r.items_revenue, 0) as items_revenue,
  coalesce(r.total_freight_value, 0) as total_freight_value,
  coalesce(r.gross_order_value, 0) as gross_order_value,

  o.total_payment_value,
  o.avg_review_score
from orders o
left join rollup r
  on o.order_id = r.order_id
