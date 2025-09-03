
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select recommendation_category
from MOVIELENS.DEV.fct_movie_recommendations
where recommendation_category is null



  
  
      
    ) dbt_internal_test