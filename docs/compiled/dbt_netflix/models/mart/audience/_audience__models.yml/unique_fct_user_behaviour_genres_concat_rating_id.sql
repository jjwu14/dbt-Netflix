
    
    

select
    rating_id as unique_field,
    count(*) as n_records

from MOVIELENS.DEV.fct_user_behaviour_genres_concat
where rating_id is not null
group by rating_id
having count(*) > 1


