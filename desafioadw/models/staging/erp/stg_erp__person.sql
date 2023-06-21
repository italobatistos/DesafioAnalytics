
with
    source_person as (
        select          		
            cast(businessentityid as int) as id_business_entity														
            ,cast((firstname || " " || lastname)as string) as name_customer										
        from {{ source('erp','person') }}
    )

select *
from source_person