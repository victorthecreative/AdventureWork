
with
    stg_sales_order_header_sales_reason as (
        select
            sales_order_header_sales_reason_sales_order_id
            ,sales_order_header_sales_reason_sales_reason_id
        from {{ ref('stg_sap__sales_order_header_sales_reason') }}
    )
    , stg_sales_reason as (
        select
            sales_reason_id
            ,sales_reason_name
            ,sales_reason_type
        from {{ ref('stg_sap__sales_reason') }}
    )
    , join_tables as (
        select
            row_number() over(order by sales_order_header_sales_reason_sales_order_id) as sales_order_header_sales_reason_sales_order_sk
            ,sales_order_header_sales_reason_sales_order_id
            ,sales_reason_id
            ,sales_reason_name
            ,sales_reason_type
        from stg_sales_order_header_sales_reason
        left join stg_sales_reason on stg_sales_order_header_sales_reason.sales_order_header_sales_reason_sales_reason_id = stg_sales_reason.sales_reason_id
    )
select *
from join_tables