
    
    

select
    customer_id || '|' || account_id || '|' || branch_id || '|' || transaction_date as unique_field,
    count(*) as n_records

from "postgres"."reporting"."transactions_eur_summary"
where customer_id || '|' || account_id || '|' || branch_id || '|' || transaction_date is not null
group by customer_id || '|' || account_id || '|' || branch_id || '|' || transaction_date
having count(*) > 1


