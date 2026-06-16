with source as (
    select * from {{ source('sales', 'sales_salesorderdetail') }}
)

, renamed as (
    select
        salesorderid
        , salesorderdetailid
        , orderqty
        , productid
        , unitprice
        , unitpricediscount
        , linetotal
    from source
)

select * from renamed
