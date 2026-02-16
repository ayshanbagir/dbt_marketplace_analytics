{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='order_id'
) }}

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
  o.avg_review_score,

  /* derived flags */
  (o.order_approved_at is not null) as is_approved,
  (o.order_delivered_customer_date is not null) as is_delivered,

  /* derived durations */
  case
    when o.order_approved_at is null then null
    else datediff(minute, o.order_purchase_date, o.order_approved_at)
  end as approval_lag_minutes,

  case
    when o.order_delivered_customer_date is null then null
    else datediff(day, o.order_purchase_date, o.order_delivered_customer_date)
  end as delivery_days,

  case
    when o.order_estimated_delivery_date is null then null
    else datediff(day, o.order_purchase_date, o.order_estimated_delivery_date)
  end as estimated_delivery_days,

  case
    when o.order_delivered_customer_date is null then null
    when o.order_estimated_delivery_date is null then null
    else (o.order_delivered_customer_date > o.order_estimated_delivery_date)
  end as is_late_delivery,

  case
    when o.order_delivered_customer_date is null then null
    when o.order_estimated_delivery_date is null then null
    when o.order_delivered_customer_date <= o.order_estimated_delivery_date then 0
    else datediff(day, o.order_estimated_delivery_date, o.order_delivered_customer_date)
  end as days_late

from orders o
left join rollup r
  on o.order_id = r.order_id

{% if is_incremental() %}
where o.order_purchase_date >= dateadd(day, -7, (select max(order_purchase_date) from {{ this }}))
{{ log('Loading ' ~ this ~ ' incrementally (all missing dates)', info=True)}}
{% endif %}