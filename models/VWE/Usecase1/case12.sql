{{ config(materialized='table') }}
select * from VWE_S3.PUBLIC.REVIEW_NEW where status = 'Happy'