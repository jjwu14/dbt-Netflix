select
    r.movie_id
from MOVIELENS.DEV.int_movie_recommendation r
left join MOVIELENS.DEV.recommendation_categories c
    on r.recommendation_category = c.category
where r.recommendation_category <> 'unclassified'
and (
    r.rating_count < c.min_ratings
    or r.avg_rating < c.avg_rating_threshold
)