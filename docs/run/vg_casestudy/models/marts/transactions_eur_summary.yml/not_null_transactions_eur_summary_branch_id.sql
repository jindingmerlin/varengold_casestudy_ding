
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select branch_id
from "postgres"."reporting"."transactions_eur_summary"
where branch_id is null



  
  
      
    ) dbt_internal_test