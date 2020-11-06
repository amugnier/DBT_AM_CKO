

        insert into analytics.cko_dbt_am.pageviews_history ("USER_ID", "PAGEVIEW_DATE_HOUR", "COUNT_PAGEVIEWS", "COUNT_DISCTINT_PAGEVIEWS", "CUSTOMER_POSTCODE")
        (
            select "USER_ID", "PAGEVIEW_DATE_HOUR", "COUNT_PAGEVIEWS", "COUNT_DISCTINT_PAGEVIEWS", "CUSTOMER_POSTCODE"
            from analytics.cko_dbt_am.pageviews_history__dbt_tmp
        );