
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select genre_name
from MOVIELENS.DEV.fct_user_behaviour_genres
where genre_name is null



  
  
      
    ) dbt_internal_test