with
    source_salesreason as (
        select * from {{ source('sales', 'sales_salesreason') }}
    )

    , renamed as (
        select
            cast(salesreasonid as bigint) as pk_salesreason
            , cast(name as string) as reason_name
            , cast(reasontype as string) as reason_type
        from source_salesreason
    )

select * from renamed
