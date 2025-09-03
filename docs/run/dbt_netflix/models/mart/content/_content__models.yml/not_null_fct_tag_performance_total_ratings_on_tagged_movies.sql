
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_ratings_on_tagged_movies
from MOVIELENS.DEV.fct_tag_performance
where total_ratings_on_tagged_movies is null



  
  
      
    ) dbt_internal_test