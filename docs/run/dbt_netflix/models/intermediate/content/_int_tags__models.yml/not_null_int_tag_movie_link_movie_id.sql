
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select movie_id
from MOVIELENS.DEV.int_tag_movie_link
where movie_id is null



  
  
      
    ) dbt_internal_test