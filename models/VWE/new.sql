{{ config(materialized='table') }}
{{ config(materialized='table') }}
 
 with
 order_new_obj as(
   Select CUSTOMER_ID,CUSTOMER_NAME,COUNTRY,STATES,CITY,REGION,ORDER_ID,ORDER_DATE,PRODUCT_ID,PRODUCT_NAME
   from  "VWE_S3"."PUBLIC"."ORDER_NEW" 
 ),
 
  order_tbl_obj as(
   Select CUSTOMER_ID,CUSTOMER_NAME,URL,"Price($)" from "VWE_S3"."PUBLIC"."ORDER_TABLE" 
 )
 
 select 
        order_new_obj.CUSTOMER_ID as ID,
        order_new_obj.CUSTOMER_NAME as NAME,
         order_new_obj.COUNTRY as COUNTRY,
         order_tbl_obj.URL as url,
         order_tbl_obj."Price($)" as PRICCCE
         from order_new_obj inner join order_tbl_obj on
         order_tbl_obj.CUSTOMER_NAME = order_new_obj.CUSTOMER_NAME
    limit 500