with orders as (
    select * from {{ ref('stg_olist_orders') }}
),
customers as (
    select * from {{ ref('stg_olist_customers') }}
),
payments as (
    select
        order_id,
        sum(payment_value) as total_payment_value,
        sum(payment_installments) as total_payment_installments,
        count(*) as payment_rows
    from {{ ref('stg_olist_order_payments') }}
    group by 1
),
reviews as (
    select
        order_id,
        avg(review_score) as avg_review_score,
        count(*) as review_rows
    from {{ ref('stg_olist_order_reviews') }}
    group by 1
)

select
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state,

    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    p.total_payment_value,
    p.total_payment_installments,
    p.payment_rows,

    r.avg_review_score,
    r.review_rows
from orders o
left join customers c on o.customer_id = c.customer_id
left join payments p on o.order_id = p.order_id
left join reviews r on o.order_id = r.order_id
