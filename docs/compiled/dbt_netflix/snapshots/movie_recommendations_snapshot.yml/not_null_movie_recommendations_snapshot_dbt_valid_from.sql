
    
    



select dbt_valid_from
from MOVIELENS.snapshots.movie_recommendations_snapshot
where dbt_valid_from is null


