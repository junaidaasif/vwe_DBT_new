{{ config(materialized='table',
    post_hook=[
      "alter table {{this}} add hello VARCHAR "
    ]
) }}
select CUSTOMER_NAME as Registration, CUSTOMER_SOURCE, CONVERSION_RATE, "Location_of_tasting_room","EVENTS",SUBSCRIPTION as Subscription  from vwe_s3.public.converted_user