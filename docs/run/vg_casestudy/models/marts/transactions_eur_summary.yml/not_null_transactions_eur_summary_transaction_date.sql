
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select transaction_date
from "postgres"."reporting"."transactions_eur_summary"
where transaction_date is null



  
  
      
    ) dbt_internal_test