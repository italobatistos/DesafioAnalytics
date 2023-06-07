
with
    source_shipmethod as (
        select          		
            cast(shipmethodid as int) as id_shipmethod				
            , cast(name	as string) as shipmethod_name									
        from {{ source('erp','shipmethod') }}
    )

select *
from source_shipmethod