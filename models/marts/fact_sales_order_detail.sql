with
    dim_address as (
        select
            address_sk
            ,address_id
            ,state_province_territory_id
        from {{ ref('dim_address') }}
    )
    ,dim_credit_card as (
        select
            credit_card_sk
            ,credit_card_id
        from {{ ref('dim_credit') }}
    )
    ,dim_customer as (
        select
            customer_sk
            ,customer_id
        from {{ ref('dim_customer') }}
    )
    ,dim_product as (
        select
            product_sk
            ,product_id
        from {{ ref('dim_product') }}
    )
    ,dim_sales_reason as (
        select
            sales_order_header_sales_reason_sales_order_sk
            ,sales_order_header_sales_reason_sales_order_id
        from {{ ref('dim_sales_reason') }}
    )
    ,stg_sales_order_detail as (
        select
            sales_order_detail_sales_order_id
            ,sales_order_detail_product_id
            ,sales_order_detail_order_qty
            ,sales_order_detail_unit_price
            ,sales_order_detail_unit_price_discount
        from {{ ref('stg_sap__sales_order_detail') }}
    )
    ,stg_sales_order_header as (
        select
            sales_order_header_sales_order_id
            ,sales_order_header_customer_id
            ,sales_order_header_territory_id
            ,sales_order_header_ship_to_address_id
            ,sales_order_header_bill_to_address_id
            ,sales_order_header_credit_card_id
            ,sales_order_header_order_date
            ,sales_order_header_due_date
            ,sales_order_header_ship_date
            ,sales_order_header_status
            ,sales_order_header_subtotal
            ,sales_order_header_total_due
        from {{ ref('stg_sap__sales_order_header') }}            
    )
     ,join_tables as (
        select
            stg_sales_order_detail.sales_order_detail_sales_order_id
            ,stg_sales_order_detail.sales_order_detail_product_id
            ,stg_sales_order_detail.sales_order_detail_order_qty
            ,stg_sales_order_detail.sales_order_detail_unit_price
            ,stg_sales_order_detail.sales_order_detail_unit_price_discount
            ,stg_sales_order_header.sales_order_header_sales_order_id
            ,stg_sales_order_header.sales_order_header_customer_id
            ,stg_sales_order_header.sales_order_header_ship_to_address_id
            ,stg_sales_order_header.sales_order_header_bill_to_address_id
            ,stg_sales_order_header.sales_order_header_territory_id
            ,stg_sales_order_header.sales_order_header_credit_card_id
            ,stg_sales_order_header.sales_order_header_order_date
            ,stg_sales_order_header.sales_order_header_due_date 
            ,stg_sales_order_header.sales_order_header_ship_date
            ,stg_sales_order_header.sales_order_header_status
            ,stg_sales_order_header.sales_order_header_subtotal
            ,stg_sales_order_header.sales_order_header_total_due
        from stg_sales_order_detail
        left join stg_sales_order_header on stg_sales_order_detail.sales_order_detail_sales_order_id = stg_sales_order_header.sales_order_header_sales_order_id
        )
    ,sales_order_detail_sales_order_sk as ( 
        select
            row_number() over(order by join_tables.sales_order_detail_sales_order_id) as sales_order_detail_sales_order_sk
            ,join_tables.sales_order_detail_sales_order_id
            ,dim_customer.customer_sk
            ,join_tables.sales_order_header_order_date
            ,join_tables.sales_order_header_due_date
            ,join_tables.sales_order_header_ship_date
            ,join_tables.sales_order_header_ship_to_address_id
            ,join_tables.sales_order_header_bill_to_address_id
            ,join_tables.sales_order_header_status
            ,ship_address.address_sk as ship_to_address_sk
            ,bill_address.address_sk as bill_to_address_sk
            ,join_tables.sales_order_header_territory_id
            ,dim_product.product_sk
            ,dim_sales_reason.sales_order_header_sales_reason_sales_order_sk
            ,join_tables.sales_order_detail_order_qty
            ,join_tables.sales_order_detail_unit_price
            ,join_tables.sales_order_detail_unit_price_discount
            ,join_tables.sales_order_header_subtotal
            ,join_tables.sales_order_header_total_due
            ,dim_credit_card.credit_card_sk
        from join_tables
        left join dim_address as ship_address on join_tables.sales_order_header_ship_to_address_id = ship_address.address_id
        left join dim_address as bill_address on join_tables.sales_order_header_bill_to_address_id = bill_address.address_id
        left join dim_credit_card on join_tables.sales_order_header_credit_card_id = dim_credit_card.credit_card_id
        left join dim_customer on join_tables.sales_order_header_customer_id = dim_customer.customer_id
        left join dim_product on join_tables.sales_order_detail_product_id = dim_product.product_id
        left join dim_sales_reason on join_tables.sales_order_detail_sales_order_id = dim_sales_reason.sales_order_header_sales_reason_sales_order_id

    )
select *
from sales_order_detail_sales_order_sk

