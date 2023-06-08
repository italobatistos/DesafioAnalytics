
with
    source_productcategory as (
        select          		
			cast(productcategoryid as int) as id_productcategory
            , cast(name as string) as productcategory_name		
        from {{ source('erp','productcategory') }}
    )

select *
from source_productcategory