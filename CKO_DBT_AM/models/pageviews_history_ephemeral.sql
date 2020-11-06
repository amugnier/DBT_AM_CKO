{{ config(materialized='ephemeral') }}


/*Add the current user postcode based on the filtered users list named "users_extract_ephemeral" */


SELECT 
	pageviews.*
	,customer_postcode -- Postcode of the user when generated
FROM  {{ ref('pageviews_extract_ephemeral') }} pageviews 
LEFT OUTER JOIN {{ ref('users_extract_ephemeral') }} users  on users.id=pageviews.user_id
