
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select total_eur
from "postgres"."reporting"."transactions_eur_summary"
where total_eur is null



  
  
      
    ) dbt_internal_test