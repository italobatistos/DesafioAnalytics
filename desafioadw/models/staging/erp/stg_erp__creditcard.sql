
with
    source_creditcard as (
        select          	
            cast(creditcardid as int) as id_creditcard				
            ,cast(cardtype as string) as cardtype_name								
        from {{ source('erp','creditcard') }}
    )

select *
from source_creditcard