
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select unique_raters
from MOVIELENS.DEV.int_movie_rating_stats
where unique_raters is null



  
  
      
    ) dbt_internal_test