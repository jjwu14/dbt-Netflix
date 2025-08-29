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