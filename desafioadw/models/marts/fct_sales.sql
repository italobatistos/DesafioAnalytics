
with
    sales as (
        select *
        from {{ ref('int_order__header') }}
    )

    , customer as (
        select *
        from {{ ref('dim_customer') }}
    )

    , products as (
        select *
        from {{ ref('dim_products') }}
    )

    , territory as (
        select *
        from {{ ref('dim_territory') }}
    )

    , joined_orders as (
        select
            sales.id_sales_order
            , sales.id_customer
            , customer.id_person
            , sales.id_bill_to_address
            , sales.id_creditcard
            , sales.id_product
            , sales.order_date
            , customer.name_customer
            , territory.state
            , territory.city
            , territory.country
            , sales.orderflag
            , sales.status_st
            , products.product_name
            , products.product_category_name
            , products.subcategory_name
            , sales.order_qty
            , sales.unit_price
            , sales.price_discount
            , sales.freight_fg 
            , sales.freight_qty_per_id
            , sales.tax_amt
            , sales.tax_amt_qty_per_id               
        from sales
        left join customer on sales.id_customer = customer.id_customer
        left join territory on sales.id_bill_to_address = territory.id_address
        left join products on sales.id_product = products.id_product
    )

    , transformations as (
        select
            {{ dbt_utils.generate_surrogate_key(['id_sales_order', 'id_product' ]) }} as sk_sales
            , *
            , order_qty * unit_price as total_bruto
            , (1-price_discount) * order_qty * unit_price as total_liquido
            , (tax_amt/tax_amt_qty_per_id) as tax
            , (freight_fg/freight_qty_per_id) as freight
        from joined_orders
    )

select *
from transformations
