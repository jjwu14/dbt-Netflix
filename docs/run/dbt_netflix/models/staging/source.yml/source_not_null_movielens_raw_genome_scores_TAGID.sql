
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select TAGID
from MOVIELENS.RAW.RAW_GENOME_SCORES
where TAGID is null



  
  
      
    ) dbt_internal_test