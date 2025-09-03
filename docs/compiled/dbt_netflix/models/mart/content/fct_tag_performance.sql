

with movie_stats as (
    select 
        movie_id,
        rating_count,
        unique_raters,
        avg_rating
    from MOVIELENS.DEV.int_movie_rating_stats
),
movie_tags as (
    select distinct movie_id, tag_id, tag
    from MOVIELENS.DEV.int_tag_movie_link
),
tag_join as (
    select
        mt.tag_id,
        mt.tag,
        ms.movie_id,
        ms.rating_count,
        ms.unique_raters,
        ms.avg_rating
    from movie_tags mt
    join movie_stats ms
        on mt.movie_id = ms.movie_id
),
by_tag as (
    select
        tag_id,
        min(tag) as tag,
        count(distinct movie_id) as movies_with_tag,
        sum(rating_count) as total_ratings_on_tagged_movies,
        sum(avg_rating * rating_count) / nullif(sum(rating_count),0) as weighted_avg_rating
    from tag_join
    group by tag_id
)
select *
from by_tag
where movies_with_tag >= 50
order by weighted_avg_rating desc nulls last