
with 
    person as (
        select *
        from {{ ref('stg_erp__person')}}
    )

    , customer as (
        select *
        from {{ ref('stg_erp__customer')}}
    )

    , join_tables as (
        select
            person.id_businessentity
            , customer.id_customer
            , customer.id_person
            , customer.id_territory
            , person.name_customer
        from person
        inner join customer on person.id_businessentity = customer.id_person
    )

    , transformations as (
        select
            row_number() over (order by id_businessentity) as sk_customer
            , *
        from join_tables
    )

select *
from transformations