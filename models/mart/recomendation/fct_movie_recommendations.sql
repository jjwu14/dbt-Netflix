{{ config(materialized='table') }}

select
    c.movie_id,
    s.title,
    g.genres_string,
    c.rating_count,
    c.avg_rating,
    c.recommendation_category
from {{ ref('int_movie_recommendation') }} c
join {{ ref('src_movies') }} s
    on c.movie_id = s.movie_id
join {{ ref('int_movie_genres_concat') }} g
    on c.movie_id = g.movie_id