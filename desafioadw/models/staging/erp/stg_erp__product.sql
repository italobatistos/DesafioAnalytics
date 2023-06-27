
with
    source_product as (
        select          		
			cast(productid as int) as id_product
            , cast(productsubcategoryid as int) as id_product_subcategory
            , cast(name as string) as product_name		
        from {{ source('erp','product') }}
    )

select *
from source_product