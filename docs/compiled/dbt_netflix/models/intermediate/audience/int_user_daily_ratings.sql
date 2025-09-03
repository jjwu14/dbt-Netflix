

select
    user_id,
    date(rating_timestamp) as rating_date,
    count(movie_id) as daily_ratings_count,
    avg(rating) as daily_avg_rating
from MOVIELENS.DEV.src_ratings


where date(rating_timestamp) > (select max(rating_date) from MOVIELENS.DEV.int_user_daily_ratings)


group by 1, 2
order by 1, 2