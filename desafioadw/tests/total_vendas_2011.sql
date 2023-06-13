{{
    config(
        severety = 'error'
    )
}}

with    
    vendas_em_2011 as (
        select sum(total_bruto) as total_vendido
        from {{ ref('fct_sales') }}
        where order_date between '2011-05-31' and '2011-12-31'
    )

select total_vendido
from vendas_em_2011
where total_vendido not between 12641672.00 and 12647000.00