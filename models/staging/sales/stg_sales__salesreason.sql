with
    fonte_salesreason as (
        select * from {{ source('sales', 'sales_salesreason') }}
    )

    , renomeado as (
        select
            salesreasonid   as pk_salesreason
            , name          as reason_name
            , reasontype    as reason_type
        from fonte_salesreason
    )

select * from renomeado
