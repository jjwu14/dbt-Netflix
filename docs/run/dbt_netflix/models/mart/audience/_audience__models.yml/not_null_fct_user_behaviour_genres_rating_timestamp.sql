
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select rating_timestamp
from MOVIELENS.DEV.fct_user_behaviour_genres
where rating_timestamp is null



  
  
      
    ) dbt_internal_test