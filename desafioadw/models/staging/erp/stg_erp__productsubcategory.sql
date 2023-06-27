
with
    source_productsubcategory as (
        select          		
			cast(productsubcategoryid as int) as id_product_subcategory
            , cast(productcategoryid as int) as id_product_category
            , cast(name as string) as subcategory_name		
        from {{ source('erp','productsubcategory') }}
    )

select *
from source_productsubcategory