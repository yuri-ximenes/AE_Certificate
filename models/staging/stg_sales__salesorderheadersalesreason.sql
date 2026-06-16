with source as (
    select * from {{ source('sales', 'sales_salesorderheadersalesreason') }}
)

, renamed as (
    select
        salesorderid
        , salesreasonid
    from source
)

select * from renamed
