
with
    source_territory as (
        select          	
            cast(territoryid as int) as id_territory				
            , cast(name	as string) as region_name	
            , cast(countryregioncode as string)	as region_code			
        from {{ source('erp','salesterritory') }}
    )

select *
from source_territory