with source as (
    select * from {{ source('sales', 'sales_customer') }}
)

, renamed as (
    select
        customerid
        , personid
        , storeid
        , territoryid
        , accountnumber
    from source
    where personid is not null
)

select * from renamed
