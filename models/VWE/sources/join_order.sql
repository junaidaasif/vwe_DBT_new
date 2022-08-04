{{ config(materialized='table') }}
 

select
  customer_name, product_name, customer_source,category

from {{ source('public', 'order_new') }}

left join {{ source('public', 'order_table') }} using (customer_id) where country = 'USA'
