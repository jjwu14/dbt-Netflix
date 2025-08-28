{{ config(materialized='table') }}


with movie_genres AS (
    SELECT movie_id, 
           TRIM(value) AS genre_name
    FROM {{ ref('src_movies') }},
    lateral flatten(input => split(genres, '|'))
) 

select
    movie_id,
    listagg(distinct genre_name, ', ') within group (order by genre_name) as genres_string
from movie_genres
group by 1


