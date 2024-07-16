{% macro get_rate(json_column, currency_column) %}

    json_extract_path_text({{ json_column }}, {{ currency_column }})
    
{% endmacro %}