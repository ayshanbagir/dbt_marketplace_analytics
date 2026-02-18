select
  review_id,
  order_id,
  nullif(review_score, '')::int as review_score,
  nullif(review_creation_date, '')::timestamp_ntz as review_creation_date,
  nullif(review_answer_timestamp, '')::timestamp_ntz as review_answer_timestamp
from {{ source('olist', 'olist_order_reviews') }}
