with
    sap_adw_creditcard as(
        select
            cast(creditcardid as int64) as credit_card_id
            ,cast(cardtype as string) as credit_card_type
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as credit_card_modified_date
        from {{source('adv_work', 'creditcard')}}
    )

select *
from sap_adw_creditcard

