select
    r.movie_id
from {{ ref('int_movie_recommendation') }} r
left join {{ ref('recommendation_categories') }} c
    on r.recommendation_category = c.category
where r.recommendation_category <> 'unclassified'
and (
    r.rating_count < c.min_ratings
    or r.avg_rating < c.avg_rating_threshold
)