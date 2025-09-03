
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select weighted_avg_rating
from MOVIELENS.DEV.fct_tag_performance
where weighted_avg_rating is null



  
  
      
    ) dbt_internal_test