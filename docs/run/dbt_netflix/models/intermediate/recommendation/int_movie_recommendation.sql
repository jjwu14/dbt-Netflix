
  
    

        create or replace transient table MOVIELENS.DEV.int_movie_recommendation
         as
        (

with rating_stats as (
    select *
    from MOVIELENS.DEV.int_movie_rating_stats
),

rules as (
    select * from MOVIELENS.DEV.recommendation_categories
),

all_matched_categories as (
    select
        r.movie_id,
        r.rating_count,
        r.avg_rating,
        rules.category,
        rules.priority
    from rating_stats r
    cross join rules
    where r.rating_count >= rules.min_ratings
      and r.avg_rating >= rules.avg_rating_threshold
),

ranked as (
    select
        *,
        row_number() over (
            partition by movie_id
            order by priority desc, category asc
        ) as rn
    from all_matched_categories
)

select
    movie_id,
    rating_count,
    avg_rating,
    category as recommendation_category
from ranked
where rn = 1
        );
      
  