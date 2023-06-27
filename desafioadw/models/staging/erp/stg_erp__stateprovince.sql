
with
    source_stateprovince as (
        select
            cast(territoryid as int) as	id_territory					
            , cast(stateprovinceid as int) as id_state_province
            , cast(countryregioncode as string) as country_region_code
            , cast(name as string) as state
        from {{ source('erp','stateprovince') }}
    )

select *
from source_stateprovince