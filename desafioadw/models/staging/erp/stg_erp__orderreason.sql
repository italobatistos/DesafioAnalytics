
with
    source_salesorderheadersalesreason as (
        select          		
            cast(salesorderid as int) as id_sales_order
            , cast(salesreasonid as int) as id_sales_reason
        from {{ source('erp','salesorderheadersalesreason') }}
    )

select *
from source_salesorderheadersalesreason