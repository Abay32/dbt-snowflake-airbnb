{% macro multiply(arg1, arg2, precision) %}
    round({{arg1}}  * {{arg2}}, {{precision}})
{% endmacro %}