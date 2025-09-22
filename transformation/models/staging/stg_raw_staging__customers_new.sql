{{ config(materialized='view', schema='staging') }}

select
    customer_id::integer        as customer_id,
    firstname::varchar          as firstname,
    lastname::varchar           as lastname,
    "Age"::integer              as age,        -- 👈 note the quotes + capital A
    branch_id::integer          as branch_id
from {{ source('raw', 'customers') }}
