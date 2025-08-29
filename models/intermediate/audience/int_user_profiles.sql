{{ config(materialized='table') }}

with user_ratings_summary as (
    select
        user_id,
        count(movie_id) as total_ratings,
        avg(rating) as overall_avg_rating
    from {{ ref('src_ratings') }}
    group by 1
),

-- rank users by total_ratings for percentile calculation
ranked_users as (
    select
        user_id,
        total_ratings,
        overall_avg_rating,
        percent_rank() over (order by total_ratings) as pct_rank
    from user_ratings_summary
)

select
    user_id,
    total_ratings,
    overall_avg_rating,
    case
        when pct_rank >= 0.95 then 'Super-High-Engagement'   -- top 5% of users
        when pct_rank >= 0.66 then 'High-Engagement'        -- next ~29%
        when pct_rank >= 0.33 then 'Medium-Engagement'      -- next ~33%
        else 'Low-Engagement'                               -- bottom ~33%
    end as engagement_level
from ranked_users
