
with
    orderheader as (
        select *
        from {{ ref('stg_erp__orderheader') }}
    )
    , transformations as (
        select
            row_number() over (order by id_sales_order) as sk_sales_order
            , *
        from orderheader
    )

select *
from transformations