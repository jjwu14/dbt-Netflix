
  
    

        create or replace transient table MOVIELENS.DEV.fct_user_behaviour
         as
        (

with ratings as (
    select
        md5(cast(coalesce(cast(user_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(movie_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(rating_timestamp as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as rating_id,
        user_id,
        movie_id,
        rating,
        rating_timestamp
    from MOVIELENS.DEV.src_ratings
    
),


ratings_with_user as (
    select
        r.*,
        u.engagement_level,
        u.total_ratings as user_total_ratings,
        u.overall_avg_rating as user_overall_avg_rating
    from ratings r
    left join MOVIELENS.DEV.int_user_profiles u
        on r.user_id = u.user_id
),

ratings_enriched as (
    select
        ru.rating_id,
        ru.user_id,
        ru.movie_id,
        ru.rating,
        g.genres_string,
        ru.rating_timestamp,
        ru.engagement_level,
        ru.user_total_ratings,
        ru.user_overall_avg_rating,
        year(ru.rating_timestamp) as rated_year,
        month(ru.rating_timestamp) as rated_month,
        day(ru.rating_timestamp) as rated_day_of_month,
        dayofweek(ru.rating_timestamp) as rated_day_of_week
    from ratings_with_user ru
    left join MOVIELENS.DEV.int_movie_genres_concat g
        on ru.movie_id = g.movie_id
)

select * from ratings_enriched





/*

with ratings as (
    select
        md5(cast(coalesce(cast(user_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(movie_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(rating_timestamp as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as rating_id,
        user_id,
        movie_id,
        rating,
        rating_timestamp
    from MOVIELENS.DEV.src_ratings
    
)

select
    t1.rating_id,
    t1.user_id,
    t1.movie_id,
    t1.rating,
    t2.genres_string,
    t1.rating_timestamp,
    year(t1.rating_timestamp) as rated_year,
    month(t1.rating_timestamp) as rated_month,
    day(t1.rating_timestamp) as rated_day_of_month,
    dayofweek(t1.rating_timestamp) as rated_day_of_week
from ratings t1
left join MOVIELENS.DEV.int_movie_genres_concat t2 on t1.movie_id = t2.movie_id

-- This block ensures that only new records are processed during incremental runs

*/













/*

with ratings as (
    select
        md5(cast(coalesce(cast(user_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(movie_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(rating_timestamp as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as rating_id,
        user_id,
        movie_id,
        rating,
        rating_timestamp
    from MOVIELENS.DEV.src_ratings
    
)

select
    t1.rating_id,
    t1.user_id,
    t1.movie_id,
    t1.rating,
    t2.genres_string,
    t1.rating_timestamp,
    year(t1.rating_timestamp) as rated_year,
    month(t1.rating_timestamp) as rated_month,
    day(t1.rating_timestamp) as rated_day_of_month,
    dayofweek(t1.rating_timestamp) as rated_day_of_week
from ratings t1
left join MOVIELENS.DEV.int_movie_genres_concat t2 on t1.movie_id = t2.movie_id*/
        );
      
  