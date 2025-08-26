{{ config(materialized='table') }}

-- This model summarizes user ratings and their engagement levels
-- It calculates total ratings and average rating per user
-- It categorizes users into engagement levels based on their total ratings
-- The engagement levels are High-Engagement, Medium-Engagement, and Low-Engagement 

with user_ratings_summary as (
    select
        user_id,
        count(movie_id) as total_ratings,
        avg(rating) as overall_avg_rating
    from {{ ref('src_ratings') }}
    group by 1
)

select
    user_id,
    total_ratings,
    overall_avg_rating,
    case
        when total_ratings >= 100 then 'High-Engagement'
        when total_ratings >= 20 then 'Medium-Engagement'
        else 'Low-Engagement'
    end as engagement_level
from user_ratings_summary