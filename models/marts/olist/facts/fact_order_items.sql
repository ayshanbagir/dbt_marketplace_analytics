select
    order_id,
    order_item_id,

    customer_id,
    customer_unique_id,
    customer_state,
    customer_city,

    product_id,
    product_category_name,

    seller_id,
    seller_state,
    seller_city,

    order_status,
    order_purchase_date,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,

    shipping_limit_date,

    price,
    freight_value,
    gross_item_value
from {{ ref('int_order_item_facts') }}
