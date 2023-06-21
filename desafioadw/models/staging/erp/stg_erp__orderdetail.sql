
with
    source_salesorderdetail as (
        select          		
            cast(salesorderid as int) as id_sales_order				
            , cast(salesorderdetailid as int) as id_order_detail
            , cast(productid as int) as id_product
            , cast(orderqty as int) as order_qty
            , cast(unitprice as numeric) as unit_price	
            , cast(unitpricediscount as numeric) as price_discount
        from {{ source('erp','salesorderdetail') }}
    )

select *
from source_salesorderdetail