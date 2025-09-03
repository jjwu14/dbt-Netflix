
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select daily_avg_rating
from MOVIELENS.DEV.int_user_daily_ratings
where daily_avg_rating is null



  
  
      
    ) dbt_internal_test