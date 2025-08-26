{% snapshot movie_recommendations_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='movie_id',
      strategy='check',
      check_cols=['recommendation_category']
    )
}}

select
    movie_id,
    recommendation_category
from {{ ref('fct_movie_recommendations') }}

{% endsnapshot %}