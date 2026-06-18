with
    fonte_creditcard as (
        select * from {{ source('sales', 'sales_creditcard') }}
    )

    , renomeado as (
        select
            cast(creditcardid as bigint)     as pk_creditcard
            , cardtype                       as card_type
        from fonte_creditcard
    )

    , sem_cartao as (
        select
            0               as pk_creditcard
            , 'Sem Cartão'  as card_type
    )

    , final as (
        select * from renomeado
        union all
        select * from sem_cartao
    )

select * from final
