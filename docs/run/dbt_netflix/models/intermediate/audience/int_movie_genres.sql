
  
    

        create or replace transient table MOVIELENS.DEV.int_movie_genres
         as
        (


with movie_genres AS (
    SELECT movie_id, 
           TRIM(value) AS genre_name
    FROM MOVIELENS.DEV.src_movies,
    lateral flatten(input => split(genres, '|'))
) 

select
    *
from movie_genres
        );
      
  