
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select relevance
from MOVIELENS.DEV.int_tag_movie_link
where relevance is null



  
  
      
    ) dbt_internal_test