
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select top_n_flag
from MOVIELENS.DEV.int_movie_top_tags
where top_n_flag is null



  
  
      
    ) dbt_internal_test