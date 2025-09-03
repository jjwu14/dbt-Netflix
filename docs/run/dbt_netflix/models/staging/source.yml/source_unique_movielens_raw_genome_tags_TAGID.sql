
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    TAGID as unique_field,
    count(*) as n_records

from MOVIELENS.RAW.RAW_GENOME_TAGS
where TAGID is not null
group by TAGID
having count(*) > 1



  
  
      
    ) dbt_internal_test