

      create or replace transient table analytics.cko_dbt_am.users_extract_Ephemere  as
      (-- Use the `ref` function to select from other models


with active_user as (Select Distinct user_id FROM analytics.cko_dbt_am.pageviews_extract_ephemere)


select *
From "ANALYTICS"."CKO_DBT_AM"."PAGEVIEWS_EXTRACT"

where user_id in (SELECT user_id FROM active_user)
      );
    