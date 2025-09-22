with source as (

    select * from "postgres"."raw"."customers"

),

renamed as (

    select
        customer_id,
        firstname,
        lastname,
        "Age" as age

    from source

)

select * from renamed