with
    source_order_reasons as (
        select * from {{ ref('stg_sales__salesorderheadersalesreason') }}
    )

    , source_reasons as (
        select * from {{ ref('stg_sales__salesreason') }}
    )

    , reasons_joined as (
        select
            source_order_reasons.fk_salesorder
            , source_reasons.reason_name
            , source_reasons.reason_type
        from source_order_reasons
        inner join source_reasons
            on source_order_reasons.fk_salesreason = source_reasons.pk_salesreason
    )

    , final as (
        select
            fk_salesorder as pk_salesorder
            , array_join(collect_set(reason_name), ', ') as order_reasons
            , array_join(collect_set(reason_type), ', ') as order_reason_types
        from reasons_joined
        group by fk_salesorder
    )

select * from final
