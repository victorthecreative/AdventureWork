with
    sap_adw_customer as (
        select
            cast(customerid as int64) as customer_id
            , cast(personid as int64) as customer_person_id
            , cast(storeid as int64) as customer_store_id
            , cast(territoryid as int64) as customer_territory_id
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as customer_modified_date
        from {{ source("adv_work", "customer") }}
    )

select *
from sap_adw_customer