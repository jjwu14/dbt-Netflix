
    
    

select
    TAGID as unique_field,
    count(*) as n_records

from MOVIELENS.RAW.RAW_GENOME_TAGS
where TAGID is not null
group by TAGID
having count(*) > 1


