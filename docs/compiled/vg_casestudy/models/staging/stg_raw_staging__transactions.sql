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