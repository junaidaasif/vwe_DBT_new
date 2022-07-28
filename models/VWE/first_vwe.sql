 {{ config(materialized='table', schema = 'dbt_schema') }}
SELECT * FROM "VWE_S3"."PUBLIC"."MULTI_ATTRIBUTE" WHERE INSERTION_ORDER = 'Pinot & Paella'