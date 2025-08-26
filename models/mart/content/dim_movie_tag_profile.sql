{{ config(materialized='table') }}

with top_tags as (
    select *
    from {{ ref('int_tag_movie_link') }}
),
ranked as (
    select
        tt.movie_id,
        tt.tag_id,
        tt.tag,
        tt.relevance,
        row_number() over (partition by tt.movie_id order by tt.relevance desc) as tag_rank
    from top_tags tt
),
agg as (
    select
        movie_id,
        listagg(tag, ', ') within group (order by tag_rank) as top_tags_list
    from ranked
    group by movie_id
)
select
    m.MOVIE_ID as movie_id,
    m.TITLE as title,
    a.top_tags_list
from agg a
join {{ ref('src_movies') }} m
    on a.movie_id = m.MOVIE_ID
