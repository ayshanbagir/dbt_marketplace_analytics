with order_items as (
    select * from {{ ref('int_order_items_enriched') }}
),
orders as (
    select
        order_id,
        customer_id,
        order_status,
        order_purchase_timestamp,
        order_delivered_customer_date
    from {{ ref('stg_olist_orders') }}
),
customers as (
    select
        customer_id,
        customer_state,
        customer_city
    from {{ ref('stg_olist_customers') }}
)

select
    oi.order_id,
    oi.order_item_id,
    o.customer_id,
    c.customer_state,
    c.customer_city,

    oi.product_id,
    oi.product_category_name,
    oi.seller_id,
    oi.seller_state,

    o.order_status,
    o.order_purchase_timestamp as order_purchase_date,
    o.order_delivered_customer_date as order_delivered_date,

    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) as gross_item_value
from order_items oi
left join orders o on oi.order_id = o.order_id
left join customers c on o.customer_id = c.customer_id
