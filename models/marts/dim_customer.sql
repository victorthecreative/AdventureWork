
with 
    stg_sales_customer as (
        select 
            customer_id
            ,customer_person_id
            ,customer_store_id
            ,customer_territory_id
        from {{ ref('stg_sap__sales_customer') }}
    )
    , stg_person as (
        select 
            person_business_entity_id
            ,concat(person_first_name, " ", person_last_name) as person_name
        from {{ ref('stg_sap__person') }}
    )
    , stg_sales_stores as (
        select
            store_business_entity_id
            ,store_name
        from {{ ref('stg_sap__sales_stores') }}
    )
    , join_tables as (
      select 
          stg_sales_customer.customer_id
          ,case
              when stg_sales_customer.customer_store_id is not null then stg_sales_stores.store_name
              else stg_person.person_name
          end as customer_name
          ,stg_sales_customer.customer_territory_id
          ,stg_sales_customer.customer_store_id
      from stg_sales_customer
      left join stg_person on stg_sales_customer.customer_person_id = stg_person.person_business_entity_id
      left join stg_sales_stores on stg_sales_customer.customer_store_id = stg_sales_stores.store_business_entity_id
    )
    , customer_sk as (
        select
            row_number() over(order by customer_id) as customer_sk
            ,customer_id
            ,customer_store_id
            ,customer_name
            ,customer_territory_id
        from join_tables
    )
select *
from customer_sk