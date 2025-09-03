-- This analysis identifies trends in movie recommendation categories,
-- highlights top movies and genres, and helps track rising stars, evergreen hits, and fading movies.
-- Useful for content acquisition, marketing, and recommendation strategy.

-- Latest recommendation category per movie
WITH  __dbt__cte__int_movie_details as (


select
    movies.movie_id,
    movies.title,
    genres.genres_string
from MOVIELENS.DEV.src_movies as movies
join MOVIELENS.DEV.int_movie_genres_concat as genres
    on movies.movie_id = genres.movie_id
), latest_recs AS (
    SELECT 
        movie_id,
        recommendation_category
    FROM MOVIELENS.DEV.fct_movie_recommendations
),

-- Enrich with movie details
genre_enriched AS (
    SELECT
        m.movie_id,
        m.title,
        m.genres_string,
        l.recommendation_category
    FROM latest_recs l
    JOIN __dbt__cte__int_movie_details m
        ON l.movie_id = m.movie_id
),

-- Summary of categories
category_summary AS (
    SELECT
        g.recommendation_category,
        COUNT(g.movie_id) AS total_movies,
        AVG(r.rating_count) AS avg_rating_count,
        AVG(r.avg_rating) AS avg_movie_rating
    FROM genre_enriched g
    JOIN MOVIELENS.DEV.int_movie_rating_stats r
        ON g.movie_id = r.movie_id
    GROUP BY g.recommendation_category
),

-- Top 10 movies per recommendation category
top_movies AS (
    SELECT
        g.movie_id,
        g.title,
        g.genres_string,
        g.recommendation_category,
        r.rating_count,
        r.avg_rating,
        ROW_NUMBER() OVER (
            PARTITION BY g.recommendation_category
            ORDER BY r.avg_rating DESC, r.rating_count DESC
        ) AS rn
    FROM genre_enriched g
    JOIN MOVIELENS.DEV.int_movie_rating_stats r
        ON g.movie_id = r.movie_id
    QUALIFY rn <= 10
)

-- Final output combining summaries and top movies
SELECT
    'Category Summary' AS analysis_section,
    recommendation_category,
    total_movies,
    avg_rating_count,
    avg_movie_rating,
    NULL AS movie_id,
    NULL AS title,
    NULL AS genres_string,
    NULL AS rating_count,
    NULL AS avg_rating
FROM category_summary

UNION ALL

SELECT
    'Top Movies' AS analysis_section,
    recommendation_category,
    NULL AS total_movies,
    NULL AS avg_rating_count,
    NULL AS avg_movie_rating,
    movie_id,
    title,
    genres_string,
    rating_count,
    avg_rating
FROM top_movies
ORDER BY analysis_section, recommendation_category;