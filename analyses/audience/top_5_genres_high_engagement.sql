SELECT
    genre_name AS genre,
    COUNT(rating) AS total_ratings_count,
    AVG(rating) AS average_rating
FROM {{ ref('fct_user_behaviour_genres') }}
WHERE engagement_level = 'High-Engagement'
GROUP BY 1
ORDER BY
    total_ratings_count DESC,
    average_rating DESC
LIMIT 5