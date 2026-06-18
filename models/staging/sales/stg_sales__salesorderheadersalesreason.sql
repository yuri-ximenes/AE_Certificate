with
    source_order_reasons as (
        select * from {{ source('sales', 'sales_salesorderheadersalesreason') }}
    )

    , renamed as (
        select
            cast(salesorderid as bigint) as fk_salesorder
            , cast(salesreasonid as bigint) as fk_salesreason
        from source_order_reasons
    )

select * from renamed
