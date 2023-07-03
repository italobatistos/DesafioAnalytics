
with
    personcreditcard as (
        select *
        from{{ ref('stg_erp__personcreditcard')}}
    )

    , creditcard as (
        select *
        from{{ ref('stg_erp__creditcard')}}
    )

    , join_creditcard as (
        select
            creditcard.id_creditcard
            , personcreditcard.id_business_entity
            , creditcard.card_type_name
        from creditcard
        left join personcreditcard on  creditcard.id_creditcard = personcreditcard.id_creditcard
    )

    , transformations as (
        select
            row_number() over (order by id_creditcard) as sk_creditcard
            , *
        from join_creditcard
    )

select *
from transformations