
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select title
from MOVIELENS.DEV.dim_movie_tag_profile
where title is null



  
  
      
    ) dbt_internal_test