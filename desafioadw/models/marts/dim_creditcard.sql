
with
    creditcard as (
        select *
        from{{ ref('stg_erp__creditcard')}}
    )

    , transformations as (
        select
            row_number() over (order by id_creditcard) as sk_creditcard
            , *
        from creditcard
    )

select *
from transformations