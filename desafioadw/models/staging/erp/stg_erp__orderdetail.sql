
with
    source_salesorderdetail as (
        select          		
            cast(salesorderid as int) as id_salesorder				
            , cast(salesorderdetailid as int) as id_orderdetail
            , cast(orderqty as int) as order_qty
            , cast(productid as int) as id_product
            , cast(unitprice as numeric) as unit_price	
            , cast(unitpricediscount as numeric) as price_discount
        from {{ source('erp','salesorderdetail') }}
    )

select *
from source_salesorderdetail