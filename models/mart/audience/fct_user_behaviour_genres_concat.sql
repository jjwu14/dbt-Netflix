{{ config(
    materialized='incremental',
    unique_key='rating_id',
    incremental_strategy='merge',
    on_schema_change='append_new_columns'
) }}

with ratings as (
    select
        {{ dbt_utils.generate_surrogate_key(['user_id', 'movie_id', 'rating_timestamp']) }} as rating_id,
        user_id,
        movie_id,
        rating,
        rating_timestamp
    from {{ ref('src_ratings') }}
    {% if is_incremental() %}
    where rating_timestamp > (select coalesce(max(rating_timestamp), '1900-01-01') from {{ this }})
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
    left join {{ ref('int_movie_genres_concat') }} g
        on ru.movie_id = g.movie_id
)

select * from ratings_enriched

