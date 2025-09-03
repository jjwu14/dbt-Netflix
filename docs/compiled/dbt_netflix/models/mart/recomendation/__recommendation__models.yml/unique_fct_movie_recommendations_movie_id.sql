
    
    

select
    movie_id as unique_field,
    count(*) as n_records

from MOVIELENS.DEV.fct_movie_recommendations
where movie_id is not null
group by movie_id
having count(*) > 1


