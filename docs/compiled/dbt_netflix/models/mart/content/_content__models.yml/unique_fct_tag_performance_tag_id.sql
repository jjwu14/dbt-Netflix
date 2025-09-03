
    
    

select
    tag_id as unique_field,
    count(*) as n_records

from MOVIELENS.DEV.fct_tag_performance
where tag_id is not null
group by tag_id
having count(*) > 1


