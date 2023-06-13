
with
    territory as (
        select *
        from{{ ref('stg_erp__territory')}}
    )

    , address as (
        select *
        from{{ ref('stg_erp__address')}}
    )

    , stateprovince as (
        select *
        from{{ ref('stg_erp__stateprovince')}}
    )

    , join_territory as (
        select
            stateprovince.id_territory
            , stateprovince.state
            , address.city
            , territory.region_name as country
        from stateprovince
        left join address on stateprovince.id_stateprovince = address.id_stateprovince
        left join territory on stateprovince.id_territory = territory.id_territory
    )

    , transformations as (
        select
            row_number() over (order by id_territory) as sk_territory
            , *
        from join_territory
    )

select *
from transformations