
  
    

  create  table "postgres"."reporting"."transactions_eur_summary__dbt_tmp"
  
  
    as
  
  (
    

with tx as (
    select
        t.account_id,
        case
            when t.transaction_date ~ '^\d{1,2}\.\d{1,2}\.\d{4}$'
                 then to_date(t.transaction_date, 'FMDD.FMMM.YYYY')
            else null
        end as transaction_date,
        case
            when position(',' in t.transaction_amount) > 0
                then replace(replace(trim(t.transaction_amount), '.', ''), ',', '.')::numeric
            else nullif(trim(t.transaction_amount), '')::numeric
        end as amount_loc,
        upper(trim(t.transaction_currency)) as currency_code
    from "postgres"."staging"."stg_raw_staging__transactions" t
),

fx_raw as (
    select
        upper(trim(currency_iso_code)) as currency_code,
        case
            when position(',' in fx_rate) > 0
                then replace(replace(trim(fx_rate), '.', ''), ',', '.')::numeric
            else nullif(trim(fx_rate), '')::numeric
        end as rate_to_eur,
        fx_rate_date
    from "postgres"."staging"."stg_raw_staging__fx_rates"
),

-- pick ONE rate per currency (latest available)
fx_latest as (
    select distinct on (currency_code)
        currency_code,
        rate_to_eur
    from fx_raw
    where rate_to_eur is not null
    order by currency_code, fx_rate_date desc  -- keeps the latest date per currency
),

tx_with_eur as (
    select
        tx.account_id,
        tx.transaction_date,
        tx.amount_loc,
        tx.currency_code,
        fx.rate_to_eur,
        tx.amount_loc * fx.rate_to_eur as amount_eur
    from tx
    left join fx_latest fx
      on fx.currency_code = tx.currency_code
),

acc as (
    select account_id, customer_id
    from "postgres"."staging"."stg_raw_staging__accounts"
),

cust as (
    select customer_id, branch_id
    from "postgres"."staging"."stg_raw_staging__customers_new"
)

select
    cust.customer_id,
    acc.account_id,
    cust.branch_id,
    tx_with_eur.transaction_date,
    sum(tx_with_eur.amount_eur) as total_eur
from tx_with_eur
join acc  on acc.account_id   = tx_with_eur.account_id
join cust on cust.customer_id = acc.customer_id
where tx_with_eur.transaction_date is not null
  and tx_with_eur.amount_loc      is not null
  and tx_with_eur.rate_to_eur     is not null
group by 1,2,3,4
  );
  