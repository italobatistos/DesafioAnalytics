
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
            , territory.id_adrress
            , territory.country_regioncode
            , territory.city
            , territory.state
            , territory.country_name
        from territory
        inner join businessentityaddress on territory.id_adrress = businessentityaddress.id_adrress
    )

select *
from join_territory