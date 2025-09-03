
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select TIMESTAMP
from MOVIELENS.RAW.RAW_RATINGS
where TIMESTAMP is null



  
  
      
    ) dbt_internal_test