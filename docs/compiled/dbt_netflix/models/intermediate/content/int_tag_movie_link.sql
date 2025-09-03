

-- Only keep movies with enough ratings
with filtered_movies as (
    select *
    from MOVIELENS.DEV.int_movie_rating_stats
    where rating_count >= 20
)

select distinct
    t.movie_id,
    t.tag_id,
    t.tag,
    t.relevance
from MOVIELENS.DEV.int_movie_top_tags t
join filtered_movies m
    on t.movie_id = m.movie_id