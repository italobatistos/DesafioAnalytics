
with
    source_salesreason as (
        select          		
            cast(salesreasonid as int) as id_salesreason
            , cast(name as string) as reason_name
            , cast(reasontype as string) as reason_type
        from {{ source('erp','salesreason') }}
    )

select *
from source_salesreason