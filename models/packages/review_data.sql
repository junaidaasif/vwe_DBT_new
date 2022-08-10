{{ config(materialized='table') }}
select * from VWE_S3.PUBLIC."reviews"