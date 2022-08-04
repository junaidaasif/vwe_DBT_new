{{ config(materialized='table') }}
select *
from {{ ref('convo_model1') }}
where subscription = 'Yes'