
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select recommendation_category
from MOVIELENS.DEV.int_movie_recommendation
where recommendation_category is null



  
  
      
    ) dbt_internal_test