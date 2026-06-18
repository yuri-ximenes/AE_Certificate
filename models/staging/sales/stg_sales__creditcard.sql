with
    fonte_creditcard as (
        select * from {{ source('sales', 'sales_creditcard') }}
    )

    , renomeado as (
        select
            creditcardid    as pk_creditcard
            , cardtype      as card_type
        from fonte_creditcard
    )

select * from renomeado
