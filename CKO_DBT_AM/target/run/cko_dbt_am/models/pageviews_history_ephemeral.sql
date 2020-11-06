

      create or replace transient table analytics.cko_dbt_am.pageviews_history_ephemeral  as
      (with __dbt__CTE__pageviews_extract_ephemeral as (
/* Config line */


/*test query base on Snowflake sample data to represent Users_extract*/ 



SELECT 
	user_id
	,date_trunc('HOUR', "PAGEVIEW_DATETIME") as pageview_date_hour
	,count ("URL") as count_pageviews
	,Count(Distinct "URL") as count_disctint_pageviews

FROM 
	"ANALYTICS"."CKO_DBT_AM"."PAGEVIEWS_EXTRACT"
Group By
	user_id
	,date_trunc('HOUR', "PAGEVIEW_DATETIME")
),  __dbt__CTE__users_extract_ephemeral as (
-- Use the `ref` function to select from other models


with active_user as (Select Distinct user_id FROM __dbt__CTE__pageviews_extract_ephemeral)


select *
From "ANALYTICS"."CKO_DBT_AM"."USERS_EXTRACT"

where id in (SELECT user_id FROM active_user)
)-- Use the `ref` function to select from other models



SELECT 
	pageviews.*
	,customer_postcode
FROM  __dbt__CTE__pageviews_extract_ephemeral pageviews
LEFT OUTER JOIN __dbt__CTE__users_extract_ephemeral users  on users.id=pageviews.user_id
      );
    