with
    sap_adw_salesreason as(
        select
             cast(salesreasonid as int64) as sales_reason_id
            ,cast(name as string) as sales_reason_name
            ,cast(reasontype as  string) as sales_reason_type
            ,datetime(parse_timestamp('%Y-%m-%d %H:%M:%E*S', modifieddate)) as sales_reason_modified_date
        from {{source('adv_work', 'salesreason')}}
    )

select *
from sap_adw_salesreason

