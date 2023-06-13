
with
    territory as (
        select *
        from{{ ref('int_address__territory')}}
    )
    , businessentityaddress as (
        select *
        from{{ ref('stg_erp__businessentityaddress')}}
    )

    , join_territory as (
        select
            territory.id_territory
            , businessentityaddress.id_businessentity
            , territory.id_address
            , territory.country_regioncode
            , territory.city
            , territory.state
            , territory.country_name
        from territory
        inner join businessentityaddress on territory.id_address = businessentityaddress.id_address
    )

    , transformations as (
        select
            row_number() over (order by id_territory) as sk_territory
            , *
        from join_territory
    )

select *
from transformations