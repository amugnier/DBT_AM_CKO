-- Use the `ref` function to select from other models


with 
	 __dbt__CTE__pageviews_extract_ephemere as (
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
),  __dbt__CTE__users_extract_Ephemere as (
-- Use the `ref` function to select from other models


with active_user as (Select Distinct user_id FROM __dbt__CTE__pageviews_extract_ephemere)


select *
From "ANALYTICS"."CKO_DBT_AM"."PAGEVIEWS_EXTRACT"

where user_id in (SELECT user_id FROM active_user)
),pageviews_extract_ephemere as __dbt__CTE__pageviews_extract_ephemere)
	,users_extract_ephemere as __dbt__CTE__users_extract_Ephemere



SELECT 
	pageviews_extract_ephemere.*
	,users_extract_ephemere.Customer_postcode
FROM  pageviews_extract_ephemere
LEFT JOIN users_extract_ephemere on users_extract_ephemere.user_id=pageviews_extract_ephemere.user_id