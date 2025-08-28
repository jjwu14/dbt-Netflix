{{ config(
    materialized='incremental',
    unique_key=['user_id', 'rating_date']
) }}

select
    user_id,
    date(rating_timestamp) as rating_date,
    count(movie_id) as daily_ratings_count,
    avg(rating) as daily_avg_rating
from {{ ref('src_ratings') }}

{% if is_incremental() %}
where date(rating_timestamp) > (select max(rating_date) from {{ this }})
{% endif %}

group by 1, 2
order by 1, 2