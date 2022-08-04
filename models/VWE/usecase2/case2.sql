 {{ config(materialized='table') }}
 select * from vwe_s3.public.latest_conversion where event_year = '2021' and conversion_status = 'Converted'
