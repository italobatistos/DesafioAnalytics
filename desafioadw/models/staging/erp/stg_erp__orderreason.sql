
with
    source_salesorderheadersalesreason as (
        select          		
            cast(salesorderid as int) as id_salesorder
            , cast(salesreasonid as int) as id_salesreason
        from {{ source('erp','salesorderheadersalesreason') }}
    )

select *
from source_salesorderheadersalesreason