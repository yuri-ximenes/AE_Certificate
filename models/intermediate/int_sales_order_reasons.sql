with
    fonte_motivos_pedido as (
        select * from {{ ref('stg_sales__salesorderheadersalesreason') }}
    )

    , fonte_motivos as (
        select * from {{ ref('stg_sales__salesreason') }}
    )

    , motivos_unidos as (
        select
            fonte_motivos_pedido.fk_salesorder
            , fonte_motivos.reason_name
            , fonte_motivos.reason_type
        from fonte_motivos_pedido
        inner join fonte_motivos
            on fonte_motivos_pedido.fk_salesreason = fonte_motivos.pk_salesreason
    )

    , final as (
        select
            fk_salesorder                                       as pk_salesorder
            , array_join(collect_set(reason_name), ', ')        as order_reasons
            , array_join(collect_set(reason_type), ', ')        as order_reason_types
        from motivos_unidos
        group by fk_salesorder
    )

select * from final
