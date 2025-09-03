
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    MOVIEID as unique_field,
    count(*) as n_records

from MOVIELENS.RAW.RAW_LINKS
where MOVIEID is not null
group by MOVIEID
having count(*) > 1



  
  
      
    ) dbt_internal_test