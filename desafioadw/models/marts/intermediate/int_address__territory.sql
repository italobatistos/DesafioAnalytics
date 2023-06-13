
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

    , countryregioncode as (
        select *
        from{{ ref('stg_erp__countryregion')}}
    )

    , join_territory as (
        select
            stateprovince.id_territory
            , address.id_address
            , countryregioncode.country_regioncode
            , address.city
            , stateprovince.state
            , countryregioncode.country_name
            , territory.region_name as country
        from stateprovince
        left join address on stateprovince.id_stateprovince = address.id_stateprovince
        left join territory on stateprovince.id_territory = territory.id_territory
        left join countryregioncode on stateprovince.country_regioncode = countryregioncode.country_regioncode
    )

select *
from join_territory