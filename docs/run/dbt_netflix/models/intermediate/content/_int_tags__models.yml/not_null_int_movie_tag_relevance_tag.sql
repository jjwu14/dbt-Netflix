
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select tag
from MOVIELENS.DEV.int_movie_tag_relevance
where tag is null



  
  
      
    ) dbt_internal_test