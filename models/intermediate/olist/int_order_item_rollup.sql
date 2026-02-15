select
  order_id,
  count(*) as item_rows,
  count(distinct product_id) as distinct_products,
  count(distinct seller_id) as distinct_sellers,
  sum(price) as items_revenue,
  sum(freight_value) as total_freight_value,
  sum(gross_item_value) as gross_order_value
from {{ ref('int_order_item_facts') }}
group by 1
