select
  product_id,
  product_category_name,
  nullif(product_name_lenght, '')::int as product_name_length,
  nullif(product_description_lenght, '')::int as product_description_length,
  nullif(product_photos_qty, '')::int as product_photos_qty,
  nullif(product_weight_g, '')::int as product_weight_g,
  nullif(product_length_cm, '')::int as product_length_cm,
  nullif(product_height_cm, '')::int as product_height_cm,
  nullif(product_width_cm, '')::int as product_width_cm
from {{ source('olist', 'olist_products') }}
