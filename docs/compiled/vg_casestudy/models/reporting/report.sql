with report as (
    select * from "postgres"."staging"."stg_raw_staging__accounts"
)
select * from report