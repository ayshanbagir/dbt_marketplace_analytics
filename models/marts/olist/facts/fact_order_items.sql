{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key=['order_id', 'order_item_id']
) }}

select
    order_id,
    order_item_id,

    customer_id,
    product_id,
    seller_id,

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

{% if is_incremental() %}

where order_purchase_date >= dateadd(day, -7, (select max(order_purchase_date) from {{ this }}))

{{ log('Loading ' ~ this ~ ' incrementally (all missing dates)', info=True)}}

{% endif %}
