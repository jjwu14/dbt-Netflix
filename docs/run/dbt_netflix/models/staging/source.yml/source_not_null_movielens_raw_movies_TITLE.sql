
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select TITLE
from MOVIELENS.RAW.RAW_MOVIES
where TITLE is null



  
  
      
    ) dbt_internal_test