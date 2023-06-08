
with
    category as (
        select *
        from{{ ref('stg_erp__productcategory')}}
    )

    , subcategory as (
        select *
        from{{ ref('stg_erp__productsubcategory')}}
    )

    , join_category as (
        select
            subcategory.id_productsubcategory
            , subcategory.id_productcategory
            , subcategory.subcategory_name
            , category.productcategory_name         
        from subcategory
        left join category on subcategory.id_productcategory = category.id_productcategory
    )

    , transformations as (
        select
            row_number() over (order by id_productsubcategory) as sk_productsubcategory
            , *
        from join_category
    )

select *
from transformations