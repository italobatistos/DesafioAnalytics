
with
    source_address as (
        select          							
             cast(city as string) as city		
            , cast(stateprovinceid as int) as id_stateprovince			
        from {{ source('erp','address') }}
    )

select *
from source_address