{% macro get_rate(column_name, country_code) %}

    ({{column_name}}['{{country_code}}']::float)

{% endmacro %}