with
    sap_adw_salesorderheadersalesreason as(
        select
             cast(salesorderid as int64) as sales_order_header_sales_reason_sales_order_id
            ,cast(salesreasonid as int64) as sales_order_header_sales_reason_sales_reason_id
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as sales_order_header_sales_reason_modified_date
        from {{source('adv_work', 'salesorderheadersalesreason')}}
    )

select *
from sap_adw_salesorderheadersalesreason

