
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select RATING
from MOVIELENS.RAW.RAW_RATINGS
where RATING is null



  
  
      
    ) dbt_internal_test