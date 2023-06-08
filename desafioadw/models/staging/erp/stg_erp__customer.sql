
with
    source_customer as (
        select          	
            cast(customerid	as int)	as id_customer						
            ,cast(storeid as int) as id_store
            ,cast(territoryid as int) as id_territory								
        from {{ source('erp','customer') }}
    )

select *
from source_customer