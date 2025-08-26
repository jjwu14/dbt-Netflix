{{ config(materialized='table') }}

select
    c.movie_id,
    d.title,
    d.genres_string,
    c.rating_count,
    c.avg_rating,
    c.recommendation_category
from {{ ref('int_movie_recommendation') }} c
join {{ ref('int_movie_details') }} d
    on c.movie_id = d.movie_id