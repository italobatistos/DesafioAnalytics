
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
            orderreason.id_salesreason as sk_reason
            ,salesreason.id_salesreason
            ,orderreason.id_salesorder
            ,salesreason.reason_name
            ,salesreason.reason_type            
        from orderreason
        left join salesreason on
            orderreason.id_salesreason = salesreason.id_salesreason
    )

    , transformations as (
        select
            row_number() over (order by sk_reason) as sk_salesreason
            , *
        from join_tables
    )

select *
from transformations