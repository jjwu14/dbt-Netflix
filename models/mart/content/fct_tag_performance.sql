{{ config(materialized='table') }}

with movie_stats as (
    select * from {{ ref('int_movie_rating_stats') }}
),
movie_tags as (
    select * from {{ ref('int_tag_movie_link') }}
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
        any_value(tag) as tag,
        count(distinct movie_id) as movies_with_tag,
        sum(rating_count) as total_ratings_on_tagged_movies,
        {{ weighted_avg('avg_rating','rating_count') }} as weighted_avg_rating
    from tag_join
    group by tag_id
)
select *
from by_tag
where movies_with_tag >= {{ var('min_tag_movies', 50) }}
order by weighted_avg_rating desc nulls last
