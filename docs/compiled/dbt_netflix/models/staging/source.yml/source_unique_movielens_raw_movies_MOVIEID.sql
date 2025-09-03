
    
    

select
    MOVIEID as unique_field,
    count(*) as n_records

from MOVIELENS.RAW.RAW_MOVIES
where MOVIEID is not null
group by MOVIEID
having count(*) > 1


