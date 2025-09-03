
  
    

        create or replace transient table MOVIELENS.DEV.int_movie_genres_concat
         as
        (


with movie_genres AS (
    SELECT movie_id, 
           TRIM(value) AS genre_name
    FROM MOVIELENS.DEV.src_movies,
    lateral flatten(input => split(genres, '|'))
) 

select
    movie_id,
    listagg(distinct genre_name, ', ') within group (order by genre_name) as genres_string
from movie_genres
group by 1
        );
      
  