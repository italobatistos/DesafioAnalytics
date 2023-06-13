
with
    source_stateprovince as (
        select
            cast(territoryid as int) as	id_territory					
            , cast(stateprovinceid as int) as id_stateprovince
            , cast(countryregioncode as string) as country_regioncode
            , cast(name as string) as state
        from {{ source('erp','stateprovince') }}
    )

select *
from source_stateprovince