{% macro tag(col) %}
CASE
  WHEN {{ col }} IS NULL THEN NULL

  WHEN CAST({{ col }} AS INT) < 100 THEN 'Low'

  WHEN CAST({{ col }} AS INT) >= 100 
       AND CAST({{ col }} AS INT) < 200 THEN 'Medium'

  ELSE 'High'
END
{% endmacro %}