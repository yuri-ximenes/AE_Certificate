with
    fonte_order_reasons as (
        select * from {{ source('sales', 'sales_salesorderheadersalesreason') }}
    )

    , renomeado as (
        select
            salesorderid    as fk_salesorder
            , salesreasonid as fk_salesreason
        from fonte_order_reasons
    )

select * from renomeado
