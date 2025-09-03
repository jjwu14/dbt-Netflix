
  
    

        create or replace transient table MOVIELENS.DEV.fct_movie_recommendations
         as
        (

with __dbt__cte__int_movie_details as (


select
    movies.movie_id,
    movies.title,
    genres.genres_string
from MOVIELENS.DEV.src_movies as movies
join MOVIELENS.DEV.int_movie_genres_concat as genres
    on movies.movie_id = genres.movie_id
) select
    c.movie_id,
    d.title,
    d.genres_string,
    c.rating_count,
    c.avg_rating,
    c.recommendation_category
from MOVIELENS.DEV.int_movie_recommendation c
join __dbt__cte__int_movie_details d
    on c.movie_id = d.movie_id
        );
      
  