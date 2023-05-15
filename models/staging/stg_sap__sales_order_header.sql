with
    sap_adw_salesorderheader as(
        select
            cast(salesorderid as int64) as sales_order_header_sales_order_id
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', orderdate)) as sales_order_header_order_date
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', duedate)) as sales_order_header_due_date
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', shipdate)) as sales_order_header_ship_date
            ,cast(status as int64) as sales_order_header_status
            ,cast(customerid as int64) as sales_order_header_customer_id
            ,cast(territoryid as int64) as sales_order_header_territory_id
            ,cast(shiptoaddressid as int64) as sales_order_header_ship_to_address_id
            ,cast(billtoaddressid as int64) as sales_order_header_bill_to_address_id
            ,cast(creditcardid as int64) as sales_order_header_credit_card_id
            ,cast(subtotal as float64) as sales_order_header_subtotal
            ,cast(totaldue as float64) as sales_order_header_total_due
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as sales_order_header_modified_date
        from {{source('adv_work', 'salesorderheader')}}
    )

select *
from sap_adw_salesorderheader

