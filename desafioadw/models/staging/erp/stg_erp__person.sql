
with
    source_person as (
        select          		
            cast(businessentityid as int) as id_businessentity														
            ,cast((firstname || " " || lastname)as string) as name										
        from {{ source('erp','person') }}
    )

select *
from source_person