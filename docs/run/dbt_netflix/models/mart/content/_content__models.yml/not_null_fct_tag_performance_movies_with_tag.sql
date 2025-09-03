
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select movies_with_tag
from MOVIELENS.DEV.fct_tag_performance
where movies_with_tag is null



  
  
      
    ) dbt_internal_test