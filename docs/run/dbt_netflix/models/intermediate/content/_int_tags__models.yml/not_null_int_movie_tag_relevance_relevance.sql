
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select relevance
from MOVIELENS.DEV.int_movie_tag_relevance
where relevance is null



  
  
      
    ) dbt_internal_test