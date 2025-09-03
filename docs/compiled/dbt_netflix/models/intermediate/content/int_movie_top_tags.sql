

select
    r.movie_id,
    r.tag_id,
    r.tag,
    r.relevance
from MOVIELENS.DEV.int_movie_tag_relevance r
qualify 
row_number() over (partition by r.movie_id order by r.relevance desc) <= 10
