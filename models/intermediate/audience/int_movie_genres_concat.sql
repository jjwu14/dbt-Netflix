-- dbt will create a physical table in Snowflake
{{ config(materialized='table') }}

-- This model aggregates movie genres into a single string per movie
-- It uses the src_movies model to extract genres and flatten them into a single string
-- The genres are separated by commas in the final output   
with movie_genres AS (
    SELECT movie_id, 
           TRIM(value) AS genre_name
    FROM {{ ref('src_movies') }},
    lateral flatten(input => split(genres, '|'))
) 


-- This outputs one row per movie with all genres concatenated into a single string
select
    movie_id,
    listagg(distinct genre_name, ', ') within group (order by genre_name) as genres_string
from movie_genres
group by 1


