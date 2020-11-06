{{ config(materialized='ephemeral') }}
/*Create a ephemaral table that contains only active user in the current pageviews_extract*/
WITH active_user as (SELECT DISTINCT user_id FROM {{ ref('pageviews_extract_ephemeral') }})

SELECT *
FROM "ANALYTICS"."CKO_DBT_AM"."USERS_EXTRACT"

WHERE id IN (SELECT user_id FROM active_user)
