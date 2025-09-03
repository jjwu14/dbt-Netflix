

select *
from MOVIELENS.DEV.int_movie_tag_relevance
where relevance < 0 or relevance > 1

