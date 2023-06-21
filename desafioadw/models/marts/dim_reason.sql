
with 
    orderreason as (
        select *
        from {{ ref('stg_erp__orderreason')}}
    )

    , salesreason as (
        select *
        from {{ ref('stg_erp__salesreason')}}
    )

    , join_tables as (
        select
            orderreason.id_sales_reason as sk_reason
            ,salesreason.id_sales_reason
            ,orderreason.id_sales_order
            ,salesreason.reason_name
            ,salesreason.reason_type            
        from orderreason
        left join salesreason on orderreason.id_sales_reason = salesreason.id_sales_reason
    )

    , transformations as (
        select
            row_number() over (order by sk_reason) as sk_sales_reason
            , *
        from join_tables
    )

select *
from transformations