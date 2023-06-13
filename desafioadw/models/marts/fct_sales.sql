
with 
    creditcard as (
        select *
        from {{ ref('dim_creditcard')}}
    )

    , customer as (
        select *
        from {{ ref('dim_customer')}}
    )

    , products as (
        select *
        from {{ ref('dim_products')}}
    )

    , territory as (
        select *
        from {{ ref('dim_salesterritory')}}
    )
    , ordersales as (
        select *
        from {{ ref('int_order__header')}}
    )

    , joined_tables as (
        select
            ordersales.id_salesorder
            , ordersales.id_customer
            , ordersales.id_territory
            , ordersales.id_shipmethod
            , ordersales.id_creditcard
            , ordersales.id_product
            , products.id_productsubcategory
            , ordersales.order_date
            , territory.region_name
            , creditcard.cardtype_name
            , ordersales.orderflag
            , ordersales.status_st
            , ordersales.shipmethod_name
            , products.product_name
            , ordersales.order_qty
            , ordersales.unit_price
            , ordersales.price_discount
            , ordersales.freight_fg  
        from ordersales
        left join creditcard on ordersales.id_creditcard = creditcard.id_creditcard
        left join customer on ordersales.id_customer = customer.id_customer
        left join products on ordersales.id_product = products.id_product
        left join territory on ordersales.id_territory = territory.id_territory

    )

    , transformations as (
        select
            {{ dbt_utils.generate_surrogate_key(['id_salesorder', 'id_customer']) }} as sk_sales
            , *
            , order_qty * unit_price as total_bruto
            , (1-price_discount) * order_qty * unit_price as total_liquido
        from joined_tables
    )

select *
from transformations