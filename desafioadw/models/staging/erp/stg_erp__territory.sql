
with
    source_territory as (
        select          	
            cast(territoryid as int) as id_territory				
            , cast(name	as string) as region_name	
            , cast(countryregioncode as string)	as region_code
            , cast(region as string) as region_group				
        from {{ source('erp','salesterritory') }}
    )

select *
from source_territory