

SELECT 
	pageviews.* -- Pageviews contains our Table tbl_Pageviews_history
	,users.customer_postcode as Latest_Post_code -- Add the latest postcode stored in the the table "USERS_EXTRACT"
FROM  analytics.cko_dbt_am.tbl_pageviews_history pageviews
LEFT OUTER JOIN "ANALYTICS"."CKO_DBT_AM"."USERS_EXTRACT" users  on users.id=pageviews.user_id