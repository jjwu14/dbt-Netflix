
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select genres_string
from MOVIELENS.DEV.int_movie_genres_concat
where genres_string is null



  
  
      
    ) dbt_internal_test