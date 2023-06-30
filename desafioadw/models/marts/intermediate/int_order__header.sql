
with
    orderdetail as (
        select *
        from {{ ref('stg_erp__orderdetail') }}
    )

    , orderheader as (
        select *
        from {{ ref('stg_erp__orderheader') }}
    )

    , joined_orders as (
        select
            orderdetail.id_sales_order
            , orderheader.id_customer
            , orderheader.id_bill_to_address
            , orderheader.id_creditcard
            , orderdetail.id_product
            , orderheader.order_date
            , orderheader.orderflag
            , orderheader.status_st
            , orderdetail.order_qty
            , orderdetail.unit_price
            , orderdetail.price_discount
            , orderheader.tax_amt
            , orderheader.freight_fg                  
        from orderheader
        left join orderdetail on orderheader.id_sales_order = orderdetail.id_sales_order
       
    )

    , transformations as (
        select
            row_number() over (order by id_sales_order) as sk_sales_order
            , *
            , (unit_price * order_qty) as total_b
            , (unit_price * order_qty * (1-price_discount)) as total
            , count(tax_amt) over (partition by id_sales_order) as tax_amt_qty_per_id
            , count(freight_fg) over (partition by id_sales_order) as freight_qty_per_id
        from joined_orders
    )

select *
from transformations