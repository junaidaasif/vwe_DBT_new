 {{ config(materialized='table') }}
 select
  *

from {{ source('public', 'order_new') }}