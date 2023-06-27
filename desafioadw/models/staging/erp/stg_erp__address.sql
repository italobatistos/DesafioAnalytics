
with
    source_address as (
        select          							
            cast(addressid as int) as id_address	
            , cast(stateprovinceid as int) as id_state_province 
            , cast(city as string) as city		
        from {{ source('erp','address') }}
    )

select *
from source_address