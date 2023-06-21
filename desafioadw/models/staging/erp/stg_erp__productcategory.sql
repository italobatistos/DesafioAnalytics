
with
    source_productcategory as (
        select          		
			cast(productcategoryid as int) as id_product_category
            , cast(name as string) as product_category_name		
        from {{ source('erp','productcategory') }}
    )

select *
from source_productcategory