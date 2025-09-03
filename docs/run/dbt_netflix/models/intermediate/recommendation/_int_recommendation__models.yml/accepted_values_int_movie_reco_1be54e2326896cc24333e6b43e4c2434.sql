
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        recommendation_category as value_field,
        count(*) as n_records

    from MOVIELENS.DEV.int_movie_recommendation
    group by recommendation_category

)

select *
from all_values
where value_field not in (
    'evergreen','rising_star','fading'
)



  
  
      
    ) dbt_internal_test