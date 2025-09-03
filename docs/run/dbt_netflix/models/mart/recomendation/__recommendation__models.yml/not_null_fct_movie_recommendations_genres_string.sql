
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select genres_string
from MOVIELENS.DEV.fct_movie_recommendations
where genres_string is null



  
  
      
    ) dbt_internal_test