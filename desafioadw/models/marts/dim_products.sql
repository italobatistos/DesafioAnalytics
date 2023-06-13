
with
    products as (
        select *
        from{{ ref('stg_erp__product')}}
    )

    , transformations as (
        select
            row_number() over (order by id_product) as sk_products
            , *
        from products
    )

select *
from transformations