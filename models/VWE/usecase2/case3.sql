{{ config(materialized='table') }}
select INSERTION_ORDER, count(TOTAL_CONVERSIONS) as Total_count from vwe_s3.public.multi_attribute where year='2021' group by(INSERTION_ORDER) 