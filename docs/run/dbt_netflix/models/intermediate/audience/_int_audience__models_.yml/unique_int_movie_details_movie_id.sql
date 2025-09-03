
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with __dbt__cte__int_movie_details as (


select
    movies.movie_id,
    movies.title,
    genres.genres_string
from MOVIELENS.DEV.src_movies as movies
join MOVIELENS.DEV.int_movie_genres_concat as genres
    on movies.movie_id = genres.movie_id
) select
    movie_id as unique_field,
    count(*) as n_records

from __dbt__cte__int_movie_details
where movie_id is not null
group by movie_id
having count(*) > 1



  
  
      
    ) dbt_internal_test