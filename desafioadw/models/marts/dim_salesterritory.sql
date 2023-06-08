
with
    sales_territory as (
        select *
        from{{ ref('stg_erp__territory')}}
    )

    , transformations as (
        select
            row_number() over (order by id_territory) as sk_territory
            , *
        from sales_territory
    )

select *
from transformations