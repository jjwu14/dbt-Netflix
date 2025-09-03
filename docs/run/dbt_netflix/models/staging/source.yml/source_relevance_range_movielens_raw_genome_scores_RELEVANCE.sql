
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

select *
from MOVIELENS.RAW.RAW_GENOME_SCORES
where RELEVANCE < 0 or RELEVANCE > 1


  
  
      
    ) dbt_internal_test