with
    source_order_reasons as (
        select * from {{ ref('stg_sales__salesorderheadersalesreason') }}
    )

    , source_reasons as (
        select * from {{ ref('stg_sales__salesreason') }}
    )

    , final as (
        select
            source_order_reasons.fk_salesorder
            , source_reasons.reason_name
            , source_reasons.reason_type
        from source_order_reasons
        inner join source_reasons
            on source_order_reasons.fk_salesreason = source_reasons.pk_salesreason
    )

select * from final
