
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

select *
from MOVIELENS.DEV.int_movie_tag_relevance
where relevance < 0 or relevance > 1


  
  
      
    ) dbt_internal_test