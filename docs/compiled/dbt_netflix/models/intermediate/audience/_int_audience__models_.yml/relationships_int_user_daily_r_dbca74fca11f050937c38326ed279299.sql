
    
    

with child as (
    select user_id as from_field
    from MOVIELENS.DEV.int_user_daily_ratings
    where user_id is not null
),

parent as (
    select USERID as to_field
    from MOVIELENS.RAW.RAW_RATINGS
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


