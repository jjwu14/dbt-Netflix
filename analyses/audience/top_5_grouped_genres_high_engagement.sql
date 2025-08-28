-- This analysis identifies the top 5 movie genres and genre groups based on average rating
-- and total ratings count, specifically for High-Engagement users.

-- Why this is useful:
-- The results can inform content acquisition strategies,
-- personalized recommendations, and targeted marketing campaigns
-- for your most valuable users.

SELECT
    genres_string AS genre,
    COUNT(rating) AS total_ratings_count,
    AVG(rating) AS average_rating
FROM {{ ref('fct_user_behaviour_genres_concat') }}
WHERE engagement_level = 'High-Engagement'
GROUP BY 1
ORDER BY
    total_ratings_count DESC,
    average_rating DESC
LIMIT 5