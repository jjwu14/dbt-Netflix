{{ config(
    materialized='incremental',
    unique_key='rating_id',
    incremental_strategy='merge',
    on_schema_change='append_new_columns'
) }}

with ratings as (
    select
        user_id,
        movie_id,
        rating,
        rating_timestamp
    from {{ ref('src_ratings') }}
    {% if is_incremental() %}
    where rating_timestamp > (
        select coalesce(max(rating_timestamp), '1900-01-01')
        from {{ this }}
    )
    {% endif %}
),

ratings_with_user as (
    select
        r.*,
        u.engagement_level,
        u.total_ratings as user_total_ratings,
        u.overall_avg_rating as user_overall_avg_rating
    from ratings r
    left join {{ ref('int_user_profiles') }} u
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
    left join {{ ref('int_movie_genres') }} g
        on ru.movie_id = g.movie_id
),

ratings_enriched as (
    select
        {{ dbt_utils.generate_surrogate_key([
            'user_id',
            'movie_id',
            'rating_timestamp',
            'genre_name',
            'genre_rank'
        ]) }} as rating_id,

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
