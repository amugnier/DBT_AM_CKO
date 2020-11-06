
{{ config(materialized='incremental') }}
/*Add Data from pageviews_history_ephemeral in the table "tbl_pageviews_history" selecting only data where the timestamp is greater the the maximun timestamp availble in the table "tbl_pageviews_history" */
	SELECT * FROM {{ref('pageviews_history_ephemeral')}}

{% if is_incremental() %}
	WHERE PAGEVIEW_DATE_HOUR > (SELECT max(PAGEVIEW_DATE_HOUR) FROM {{ this }})
{% endif %}


