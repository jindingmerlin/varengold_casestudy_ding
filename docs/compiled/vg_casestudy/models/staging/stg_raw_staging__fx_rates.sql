with source as (

    select * from "postgres"."raw"."fx_rates"

),

renamed as (

    select
        currency_iso_code,
        fx_rate,
        TO_DATE(date, 'DD.MM.YYYY') as fx_rate_date

    from source
    where currency_iso_code is not null or currency_iso_code != ''

)

select * from renamed