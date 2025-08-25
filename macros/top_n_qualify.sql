{% macro top_n_qualify(partition_by, order_by, n) %}
row_number() over (partition by {{ partition_by }} order by {{ order_by }} desc) <= {{ n }}
{% endmacro %}
