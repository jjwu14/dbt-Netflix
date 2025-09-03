
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select avg_rating
from MOVIELENS.DEV.int_movie_rating_stats
where avg_rating is null



  
  
      
    ) dbt_internal_test