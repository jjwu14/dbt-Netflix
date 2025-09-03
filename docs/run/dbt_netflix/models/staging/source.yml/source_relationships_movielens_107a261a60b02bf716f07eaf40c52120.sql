
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select MOVIEID as from_field
    from MOVIELENS.RAW.RAW_RATINGS
    where MOVIEID is not null
),

parent as (
    select MOVIEID as to_field
    from MOVIELENS.RAW.RAW_MOVIES
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test