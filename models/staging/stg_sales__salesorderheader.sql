with source as (
    select * from {{ source('sales', 'sales_salesorderheader') }}
)

, renamed as (
    select
        salesorderid
        , orderdate
        , duedate
        , shipdate
        , status
        , onlineorderflag
        , customerid
        , territoryid
        , shiptoaddressid
        , subtotal
        , taxamt
        , freight
        , totaldue
    from source
)

select * from renamed
