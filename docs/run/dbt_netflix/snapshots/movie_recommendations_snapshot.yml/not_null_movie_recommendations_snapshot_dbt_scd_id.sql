
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select dbt_scd_id
from MOVIELENS.snapshots.movie_recommendations_snapshot
where dbt_scd_id is null



  
  
      
    ) dbt_internal_test