
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select USERID
from MOVIELENS.RAW.RAW_RATINGS
where USERID is null



  
  
      
    ) dbt_internal_test