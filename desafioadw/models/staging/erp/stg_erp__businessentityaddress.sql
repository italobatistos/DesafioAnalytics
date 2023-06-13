
with
    source_businessentityaddress as (
        select          							
            cast(businessentityid as int) as id_businessentity
            , cast(addressid as int) as id_adrress
        from {{ source('erp','businessentityaddress') }}
    )

select *
from source_businessentityaddress