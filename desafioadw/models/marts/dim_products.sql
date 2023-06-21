
with
    category as (
        select *
        from{{ ref('stg_erp__productcategory')}}
    )

    , subcategory as (
        select *
        from{{ ref('stg_erp__productsubcategory')}}
    )
    , products as (
        select *
        from{{ ref('stg_erp__product')}}
    )

    , join_products as (
        select
            products.id_product
            , subcategory.id_product_category
            , subcategory.id_product_subcategory
            , products.product_name
            , category.product_category_name 
            , subcategory.subcategory_name     
        from subcategory
        left join category on subcategory.id_product_category = category.id_product_category
        left join products on subcategory.id_product_subcategory = products.id_product_subcategory
    )


    , transformations as (
        select
            row_number() over (order by id_product) as sk_products
            , *
        from join_products
    )

select *
from transformations