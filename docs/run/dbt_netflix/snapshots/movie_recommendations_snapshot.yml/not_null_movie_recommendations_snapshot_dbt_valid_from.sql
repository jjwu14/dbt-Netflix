
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select dbt_valid_from
from MOVIELENS.snapshots.movie_recommendations_snapshot
where dbt_valid_from is null



  
  
      
    ) dbt_internal_test