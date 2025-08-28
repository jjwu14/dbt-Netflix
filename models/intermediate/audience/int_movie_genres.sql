{{ config(materialized='table') }}


with movie_genres AS (
    SELECT movie_id, 
           TRIM(value) AS genre_name
    FROM {{ ref('src_movies') }},
    lateral flatten(input => split(genres, '|'))
) 

select
    *
from movie_genres


