{{ config(materialized='table') }}
UPDATE  VWE_S3.PUBLIC.REVIEW_NEW
SET  REMARKS_BY_UNHAPPY_CUSTOMERS =CASE
    WHEN (RATING  = 5) THEN (  'Product quality is good and taste is good' )
    WHEN (RATING  = 4) THEN ( 'Safe On Time delivery' )
    WHEN (RATING =3) THEN (  'Taste is good')
    WHEN (RATING =2) THEN (   'Did not like the smell and taste')
    WHEN (RATING =1) THEN ('Delayed Shipment')
END
WHERE REMARKS_BY_UNHAPPY_CUSTOMERS IS NULL


select 
    case 
    WHEN (RATING  = 5) THEN (  'Product quality is good and taste is good' )
    WHEN (RATING  = 4) THEN ( 'Safe On Time delivery' )
    WHEN (RATING =3) THEN (  'Taste is good')
    WHEN (RATING =2) THEN (   'Did not like the smell and taste')
    WHEN (RATING =1) THEN ('Delayed Shipment')
END
WHERE REMARKS_BY_UNHAPPY_CUSTOMERS IS NULL

from VWE_S3.PUBLIC.REVIEW_NEW

{% if update %}
Select c1,c2,c3,
case when c1 = ‘US’ then 3.3 else c4 end as c4
from t1
{% else %}
SELECT * FROM member;
{% endif %}