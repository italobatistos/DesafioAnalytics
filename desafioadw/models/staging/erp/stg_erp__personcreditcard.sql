
with
    source_personcreditcard as (
        select          							
            cast(businessentityid as int) as id_business_entity				
            , cast(creditcardid	as int) as id_creditcard		
        from {{ source('erp','personcreditcard') }}
    )

select *
from source_personcreditcard