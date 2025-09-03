
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select engagement_level
from MOVIELENS.DEV.int_user_profiles
where engagement_level is null



  
  
      
    ) dbt_internal_test