
with
    source_customer as (
        select          	
            cast(customerid	as int)	as id_customer						
            ,cast(personid as int) as id_person
            ,cast(territoryid as int) as id_territory								
        from {{ source('erp','customer') }}
    )

select *
from source_customer