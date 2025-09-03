
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select top_tags_list
from MOVIELENS.DEV.dim_movie_tag_profile
where top_tags_list is null



  
  
      
    ) dbt_internal_test