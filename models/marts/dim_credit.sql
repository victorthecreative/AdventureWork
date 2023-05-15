with
    stg_sales_credit_card as (
        select 
            row_number() over (order by credit_card_id) as credit_card_sk
            ,credit_card_id
            ,credit_card_type

        from {{ ref('stg_sap__sales_credit_card') }}
    )

select *
from stg_sales_credit_card