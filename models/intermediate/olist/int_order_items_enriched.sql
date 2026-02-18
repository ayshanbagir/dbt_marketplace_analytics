with items as (
    select * from {{ ref('stg_olist_order_items') }}
),
products as (
    select * from {{ ref('stg_olist_products') }}
),
sellers as (
    select * from {{ ref('stg_olist_sellers') }}
)

select
    i.order_id,
    i.order_item_id,
    i.product_id,
    i.seller_id,
    i.shipping_limit_date,
    i.price,
    i.freight_value,

    p.product_category_name,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm,

    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state
from items i
left join products p on i.product_id = p.product_id
left join sellers s on i.seller_id = s.seller_id
