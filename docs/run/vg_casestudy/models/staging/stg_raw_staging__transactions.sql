
  create view "postgres"."staging"."stg_raw_staging__transactions__dbt_tmp"
    
    
  as (
    with source as (

    select * from "postgres"."raw"."transactions"

),

renamed as (

    select
        transaction_id,
        transaction_date,
        account_id,
        transaction_type,
        transaction_amount,
        transaction_currency

    from source

)

select * from renamed
  );