

      create or replace transient table analytics.cko_dbt_am.tbl_pageviews_history  as
      (
with __dbt__CTE__pageviews_extract_ephemeral as (
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

/*Create a ephemaral table that contains only active user in the current pageviews_extract*/
WITH active_user as (SELECT DISTINCT user_id FROM __dbt__CTE__pageviews_extract_ephemeral)

SELECT *
FROM "ANALYTICS"."CKO_DBT_AM"."USERS_EXTRACT"

WHERE id IN (SELECT user_id FROM active_user)
),  __dbt__CTE__pageviews_history_ephemeral as (



/*Add the current user postcode based on the filtered users list named "users_extract_ephemeral" */


SELECT 
	pageviews.*
	,customer_postcode -- Postcode of the user when generated
FROM  __dbt__CTE__pageviews_extract_ephemeral pageviews 
LEFT OUTER JOIN __dbt__CTE__users_extract_ephemeral users  on users.id=pageviews.user_id
)/*Add Data from pageviews_history_ephemeral in the table "tbl_pageviews_history" selecting only data where the timestamp is greater the the maximun timestamp availble in the table "tbl_pageviews_history" */
	SELECT * FROM __dbt__CTE__pageviews_history_ephemeral


      );
    