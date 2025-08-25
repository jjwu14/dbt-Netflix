{{ config(materialized='table') }}

-- Only keep movies with a minimum number of ratings, then attach their top tags
with filtered_movies as (
  select *
  from {{ ref('int_movie_rating_stats') }}
  where rating_count >= {{ var('min_movie_ratings', 20) }}
)
select
  t.movie_id,
  t.tag_id,
  t.tag,
  t.relevance
from {{ ref('int_movie_top_tags') }} t
join filtered_movies m
  on t.movie_id = m.movie_id
