
with
    stateprovince as (
        select *
        from{{ ref('stg_erp__stateprovince')}}
    )

    , countryregioncode as (
        select *
        from{{ ref('stg_erp__countryregion')}}
    )

    , join_territory as (
        select
            stateprovince.id_state_province
            , stateprovince.id_territory
            , countryregioncode.country_region_code
            , stateprovince.state
            , countryregioncode.country_name
        from stateprovince
        left join countryregioncode on stateprovince.country_region_code = countryregioncode.country_region_code
    )

    , transformations as (
        select
            row_number() over (order by id_state_province) as sk_state_province
            , *
        from join_territory
    )

select *
from transformations