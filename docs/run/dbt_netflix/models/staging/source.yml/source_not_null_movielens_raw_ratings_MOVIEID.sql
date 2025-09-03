
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select MOVIEID
from MOVIELENS.RAW.RAW_RATINGS
where MOVIEID is null



  
  
      
    ) dbt_internal_test