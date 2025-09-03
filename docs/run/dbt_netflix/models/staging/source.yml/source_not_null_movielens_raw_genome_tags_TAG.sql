
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select TAG
from MOVIELENS.RAW.RAW_GENOME_TAGS
where TAG is null



  
  
      
    ) dbt_internal_test