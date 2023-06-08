
with
    source_stateprovince as (
        select
            cast(territoryid as int) as	id_territory					
            , cast(name as string) as state
            , cast(stateprovinceid as int) as id_stateprovince
        from {{ source('erp','stateprovince') }}
    )

select *
from source_stateprovince