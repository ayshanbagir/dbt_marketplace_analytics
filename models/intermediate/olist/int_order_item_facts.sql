with order_items as (
    select * from {{ ref('int_order_items_enriched') }}
),
orders as (
    select * from {{ ref('int_orders_enriched') }}
)

select
    oi.order_id,
    oi.order_item_id,
    o.customer_id,
    o.customer_unique_id,
    o.customer_zip_code_prefix,
    o.customer_city,
    o.customer_state,

    oi.product_id,
    oi.product_category_name,
    oi.product_weight_g,
    oi.product_length_cm,
    oi.product_height_cm,
    oi.product_width_cm,

    oi.seller_id,
    oi.seller_zip_code_prefix,
    oi.seller_city,
    oi.seller_state,

    o.order_status,
    o.order_purchase_date,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    oi.shipping_limit_date,
    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) as gross_item_value
from order_items oi
left join orders o on oi.order_id = o.order_id