
    
    



select currency_iso_code
from "postgres"."staging"."stg_raw_staging__fx_rates"
where currency_iso_code is null


