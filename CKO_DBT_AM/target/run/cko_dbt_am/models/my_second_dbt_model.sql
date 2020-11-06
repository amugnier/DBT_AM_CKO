
  create or replace  view analytics.cko_dbt_am.my_second_dbt_model  as (
    -- Use the `ref` function to select from other models

select *
from analytics.cko_dbt_am.my_first_dbt_model
where id = 1
  );
