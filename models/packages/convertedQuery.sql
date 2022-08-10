{% set sql_statement %}
    select conversion_rate from VWE_S3.PUBLIC.CONVERTED_USER
{% endset %}

{%- set conversion= dbt_utils.get_query_results_as_dict(sql_statement) -%}

select
CUSTOMER_NAME,
    {% for convo in conversion['conversion_rate'] | unique -%}
      sum(case when conversion_rate = '{{ convo }}' then 1 else 0 end) as users_in_{{ dbt_utils.slugify(convo) }},
    {% endfor %}

    count(*) as total_total

from VWE_S3.PUBLIC.CONVERTED_USER
group by CUSTOMER_NAME