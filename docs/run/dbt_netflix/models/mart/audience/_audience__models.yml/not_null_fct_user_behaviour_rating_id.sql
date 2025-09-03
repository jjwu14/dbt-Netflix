
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select rating_id
from MOVIELENS.DEV.fct_user_behaviour
where rating_id is null



  
  
      
    ) dbt_internal_test