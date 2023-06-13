
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
            , subcategory.id_productcategory
            , subcategory.id_productsubcategory
            , products.product_name
            , category.productcategory_name 
            , subcategory.subcategory_name     
        from subcategory
        left join category on subcategory.id_productcategory = category.id_productcategory
        left join products on subcategory.id_productsubcategory = products.id_productsubcategory
    )


    , transformations as (
        select
            row_number() over (order by id_productsubcategory) as sk_subcatproducts
            , *
        from join_products
    )

select *
from transformations