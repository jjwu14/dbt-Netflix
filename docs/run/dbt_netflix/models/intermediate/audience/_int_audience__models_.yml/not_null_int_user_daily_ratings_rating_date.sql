
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select rating_date
from MOVIELENS.DEV.int_user_daily_ratings
where rating_date is null



  
  
      
    ) dbt_internal_test