
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select account_id
from "postgres"."reporting"."transactions_eur_summary"
where account_id is null



  
  
      
    ) dbt_internal_test