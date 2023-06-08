
with 
    customer as (
        select *
        from {{ ref('stg_erp__customer')}}
    )

    ,person as (
        select *
        from {{ ref('stg_erp__person')}}
    )

    , join_tables as (
        select
            customer.id_customer
            , customer.id_store
            , customer.id_territory
            , person.id_businessentity
            , person.name
        from customer
        left join person on
            customer.id_customer = person.id_businessentity
    )

    , transformations as (
        select
            row_number() over (order by id_customer) as sk_customer
            , *
        from join_tables
    )

select *
from transformations