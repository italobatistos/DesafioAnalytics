
with
    source_salesorderheader as (
        select          		
            cast(salesorderid as int) as id_salesorder								
            , cast(orderdate as datetime) as order_date								
            , cast(customerid as int) as id_customer			 				
            , cast(territoryid as int) as id_territory		
            , cast(shipmethodid as int) as id_shipmethod			
            , cast(creditcardid as int) as id_creditcard											
            , cast(subtotal as numeric) as sub_total				
            , cast(taxamt as numeric) as tax_amt				
            , cast(freight as numeric) as freight_fg					
            , cast(totaldue as numeric) as total_due
            , case
                when status = 1 then 'In process'
                when status = 2 then 'Aprroved'
                when status = 3 then 'Backordered'
                when status = 4 then 'Rejected'
                when status = 5 then 'Shipped'
                else 'Cancelled'
            end as status_st
            , case
                when onlineorderflag = true then 'Online order'
                else 'Sales person'
            end as orderflag
        from {{ source('erp','salesorderheader') }}
    )

select *
from source_salesorderheader