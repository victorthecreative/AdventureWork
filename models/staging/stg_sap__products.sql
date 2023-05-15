with
    sap_adw_product as (

        select
            cast(productid as int64) as product_id
            ,cast(name as string) as product_name
            ,cast(productnumber as string) as product_number
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as product_modified_date
        from {{source('adv_work', 'product')}}
    )

select *
from sap_adw_product

