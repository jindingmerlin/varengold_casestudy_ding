
  create view "postgres"."staging"."stg_raw_staging__customers_new__dbt_tmp"
    
    
  as (
    

select
    customer_id::integer        as customer_id,
    firstname::varchar          as firstname,
    lastname::varchar           as lastname,
    "Age"::integer              as age,        -- 👈 note the quotes + capital A
    branch_id::integer          as branch_id
from "postgres"."raw"."customers"
  );