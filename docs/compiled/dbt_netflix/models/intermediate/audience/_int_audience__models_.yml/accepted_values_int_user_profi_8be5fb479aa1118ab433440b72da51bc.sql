
    
    

with all_values as (

    select
        engagement_level as value_field,
        count(*) as n_records

    from MOVIELENS.DEV.int_user_profiles
    group by engagement_level

)

select *
from all_values
where value_field not in (
    'High-Engagement','Low-Engagement','Medium-Engagement'
)


