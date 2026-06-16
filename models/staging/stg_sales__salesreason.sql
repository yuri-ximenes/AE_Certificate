with source as (
    select * from {{ source('sales', 'sales_salesreason') }}
)

, renamed as (
    select
        salesreasonid
        , name        as reason_name
        , reasontype  as reason_type
    from source
)

select * from renamed
