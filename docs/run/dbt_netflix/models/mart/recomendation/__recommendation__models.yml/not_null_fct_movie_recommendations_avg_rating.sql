
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select avg_rating
from MOVIELENS.DEV.fct_movie_recommendations
where avg_rating is null



  
  
      
    ) dbt_internal_test