{{ config(materialized='table') }}

select
  movie_id,
  count(*)                                      as rating_count,
  count(distinct user_id)                       as unique_raters,
  avg(rating)                                   as avg_rating
from {{ ref('src_ratings') }}
group by 1
