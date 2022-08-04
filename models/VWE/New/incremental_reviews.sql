{{
    config(
        materialized='incremental')
        
}}

select
    date_trunc('day', ORDER_DATE) as date_day,
    count(distinct ORDER_ID) as total_orders,
   count(distinct CUSTOMER_ID) as daily_users
 from  VWE_S3.PUBLIC.REVIEWS


{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where date_day >= (select max(date_day) from {{ this }})

{% endif %}

group by 1