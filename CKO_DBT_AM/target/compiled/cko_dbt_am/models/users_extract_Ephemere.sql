-- Use the `ref` function to select from other models


with  __dbt__CTE__pageviews_extract_ephemeral as (
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
),active_user as (Select Distinct user_id FROM __dbt__CTE__pageviews_extract_ephemeral)


select *
From "ANALYTICS"."CKO_DBT_AM"."USERS_EXTRACT"

where id in (SELECT user_id FROM active_user)