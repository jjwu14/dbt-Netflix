{% macro weighted_avg(val_expr, wt_expr) -%}
nullif(sum({{ val_expr }} * {{ wt_expr }}), 0) / nullif(sum({{ wt_expr }}), 0)
{%- endmacro %}