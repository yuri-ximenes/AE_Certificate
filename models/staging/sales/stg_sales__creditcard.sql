with
    source_creditcard as (
        select * from {{ source('sales', 'sales_creditcard') }}
    )

    , renamed as (
        select
            cast(creditcardid as bigint) as pk_creditcard
            , cast(cardtype as string) as card_type
        from source_creditcard
    )

    , no_card as (
        select
            cast(0 as bigint) as pk_creditcard
            , cast('Sem Cartão' as string) as card_type
    )

    , final as (
        select * from renamed
        union all
        select * from no_card
    )

select * from final
