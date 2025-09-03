

with ratings as (
    select
        user_id,
        movie_id,
        rating,
        rating_timestamp
    from MOVIELENS.DEV.src_ratings
    
    where rating_timestamp > (
        select coalesce(max(rating_timestamp), '1900-01-01')
        from MOVIELENS.DEV.fct_user_behaviour_genres
    )
    
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

ratings_with_genres as (
    select
        ru.*,
        g.genre_name,
        row_number() over (
            partition by ru.user_id, ru.movie_id, ru.rating_timestamp
            order by g.genre_name
        ) as genre_rank
    from ratings_with_user ru
    left join MOVIELENS.DEV.int_movie_genres g
        on ru.movie_id = g.movie_id
),

ratings_enriched as (
    select
        md5(cast(coalesce(cast(user_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(movie_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(rating_timestamp as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(genre_name as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(genre_rank as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as rating_id,

        user_id,
        movie_id,
        rating,
        genre_name,
        rating_timestamp,
        engagement_level,
        user_total_ratings,
        user_overall_avg_rating,

        year(rating_timestamp) as rated_year,
        month(rating_timestamp) as rated_month,
        day(rating_timestamp) as rated_day_of_month,
        dayofweek(rating_timestamp) as rated_day_of_week
    from ratings_with_genres
)

select * 
from ratings_enriched