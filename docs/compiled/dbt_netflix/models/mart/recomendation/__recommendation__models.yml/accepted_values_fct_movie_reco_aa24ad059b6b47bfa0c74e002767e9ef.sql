
    
    

with all_values as (

    select
        recommendation_category as value_field,
        count(*) as n_records

    from MOVIELENS.DEV.fct_movie_recommendations
    group by recommendation_category

)

select *
from all_values
where value_field not in (
    'evergreen','rising_star','fading'
)


