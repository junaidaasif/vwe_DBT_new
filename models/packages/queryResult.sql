{% set sql_statement %}
    select rating from {{ ref('review_data') }}
{% endset %}

{%- set places = dbt_utils.get_query_results_as_dict(sql_statement) -%}

select
CUSTOMER_ID,
    {% for city in places['RATING'] | unique -%}
      sum(case when rating = '{{ city }}' then 1 else 0 end) as users_in_{{ dbt_utils.slugify(city) }},
    {% endfor %}

    count(*) as total_total

from {{ ref('review_data') }}
group by CUSTOMER_ID