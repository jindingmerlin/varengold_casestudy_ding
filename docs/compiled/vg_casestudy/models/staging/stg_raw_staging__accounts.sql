with source as (

    select * from "postgres"."raw"."accounts"

),

renamed as (

    select
        account_id,
        customer_id,
        account_type,
        TO_DATE(account_opening_date, 'DD.MM.YYYY') as account_opening_date

    from source

)

select * from renamed