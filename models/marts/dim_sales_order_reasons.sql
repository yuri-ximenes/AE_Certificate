with order_reasons as (
    select * from {{ ref('stg_sales__salesorderheadersalesreason') }}
)

, reasons as (
    select * from {{ ref('stg_sales__salesreason') }}
)

, joined as (
    select
        order_reasons.salesorderid
        , reasons.reason_name
        , reasons.reason_type
    from order_reasons
    inner join reasons
        on order_reasons.salesreasonid = reasons.salesreasonid
)

, final as (
    select
        salesorderid
        , array_join(collect_set(reason_name), ', ')   as order_reasons
        , array_join(collect_set(reason_type), ', ')   as order_reason_types
    from joined
    group by salesorderid
)

select * from final
