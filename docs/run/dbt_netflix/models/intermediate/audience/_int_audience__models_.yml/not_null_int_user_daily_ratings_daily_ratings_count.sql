
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select daily_ratings_count
from MOVIELENS.DEV.int_user_daily_ratings
where daily_ratings_count is null



  
  
      
    ) dbt_internal_test