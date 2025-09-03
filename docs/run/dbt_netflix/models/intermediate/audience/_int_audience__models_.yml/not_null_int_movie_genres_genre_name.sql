
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select genre_name
from MOVIELENS.DEV.int_movie_genres
where genre_name is null



  
  
      
    ) dbt_internal_test