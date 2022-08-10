{% set california_cities = dbt_utils.get_query_results_as_dict("select states from VWE_S3.PUBLIC.CONVERTED_USER where states = 'California' and REGION is not null ") %}
select
 
{% for city in california_cities %}
  sum(case when states = {{ city }} then 1 else 0 end) as users_in_{{ city }},
{% endfor %}
  count(*) as total
from VWE_S3.PUBLIC.CONVERTED_USER

