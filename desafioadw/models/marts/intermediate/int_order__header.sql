
with
    shipmethod as (
        select *
        from {{ ref('stg_erp__shipmethod') }}
    )

    , orderdetail as (
        select *
        from {{ ref('stg_erp__orderdetail') }}
    )

    , orderheader as (
        select *
        from {{ ref('stg_erp__orderheader') }}
    )

    , joined_orders as (
        select
            orderdetail.id_salesorder
            , orderheader.id_customer
            , orderheader.id_territory
            , orderheader.id_shipmethod
            , orderheader.id_creditcard
            , orderdetail.id_product
            , orderheader.order_date
            , orderheader.orderflag
            , orderheader.status_st
            , shipmethod.shipmethod_name
            , orderdetail.order_qty
            , orderdetail.unit_price
            , orderdetail.price_discount
            , orderheader.freight_fg                  
        from orderheader
        left join orderdetail on
            orderheader.id_salesorder = orderdetail.id_salesorder
        left join shipmethod on
            orderheader.id_shipmethod = shipmethod.id_shipmethod
       
    )

    , transformations as (
        select
            row_number() over (order by id_salesorder) as sk_salesorder
            , *
            , (unit_price * order_qty) as total_b
            , (unit_price * order_qty * (1-price_discount)) as total
        from joined_orders
    )

select *
from transformations