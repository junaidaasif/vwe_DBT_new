{{ config(materialized='table') }}
select a.CUSTOMER_NAME , a.age, a.gender, a.status, a.rating, a.region from VWE_S3.PUBLIC.REVIEW_NEW as a
inner join VWE_S3.PUBLIC."reviews" as b on a.CUSTOMER_ID = b.CUSTOMER_ID where a.status = 'Happy'