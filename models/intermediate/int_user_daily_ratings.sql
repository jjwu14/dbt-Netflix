{{ config(materialized='table') }}

-- This model aggregates user ratings on a daily basis
-- It uses the src_ratings model to extract user ratings and group them by user and date
-- The output includes the count of ratings and the average rating per user per day
select
    user_id,
    date(rating_timestamp) as rating_date,
    count(movie_id) as daily_ratings_count,
    avg(rating) as daily_avg_rating
from {{ ref('src_ratings') }}
group by 1, 2
order by 1, 2