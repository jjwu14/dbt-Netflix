-- this model is set to ephemeral because it is only used to join with other models, and only used by one downstream model
{{ config(materialized='ephemeral') }}

select
    movies.movie_id,
    movies.title,
    genres.genres_string
from {{ ref('src_movies') }} as movies
join {{ ref('int_movie_genres_concat') }} as genres
    on movies.movie_id = genres.movie_id