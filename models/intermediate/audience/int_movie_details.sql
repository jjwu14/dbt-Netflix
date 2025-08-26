{{ config(materialized='table') }}

select
    movies.movie_id,
    movies.title,
    genres.genres_string
from {{ ref('src_movies') }} as movies
join {{ ref('int_movie_genres_concat') }} as genres
    on movies.movie_id = genres.movie_id