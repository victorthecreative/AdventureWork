with
    stg_product as (
        select
            row_number() over(order by product_id) as product_sk
            ,product_id
            ,product_name
            ,product_number
        from {{ ref('stg_sap__products') }}
    )
select *
from stg_product