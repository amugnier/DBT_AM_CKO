

      create or replace transient table analytics.cko_dbt_am.pageviews_extract_ephemere  as
      (/* Config line */


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
      );
    