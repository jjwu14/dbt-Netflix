-- back compat for old kwarg name
  
  begin;
    
        
            
                
                
            
                
                
            
        
    

    

    merge into MOVIELENS.DEV.int_user_daily_ratings as DBT_INTERNAL_DEST
        using MOVIELENS.DEV.int_user_daily_ratings__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                    DBT_INTERNAL_SOURCE.user_id = DBT_INTERNAL_DEST.user_id
                ) and (
                    DBT_INTERNAL_SOURCE.rating_date = DBT_INTERNAL_DEST.rating_date
                )

    
    when matched then update set
        "USER_ID" = DBT_INTERNAL_SOURCE."USER_ID","RATING_DATE" = DBT_INTERNAL_SOURCE."RATING_DATE","DAILY_RATINGS_COUNT" = DBT_INTERNAL_SOURCE."DAILY_RATINGS_COUNT","DAILY_AVG_RATING" = DBT_INTERNAL_SOURCE."DAILY_AVG_RATING"
    

    when not matched then insert
        ("USER_ID", "RATING_DATE", "DAILY_RATINGS_COUNT", "DAILY_AVG_RATING")
    values
        ("USER_ID", "RATING_DATE", "DAILY_RATINGS_COUNT", "DAILY_AVG_RATING")

;
    commit;