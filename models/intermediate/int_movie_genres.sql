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

-- Row per movie-genre pair
select
    *
from movie_genres


