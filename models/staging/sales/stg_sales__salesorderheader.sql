with
    source_salesorderheader as (
        select * from {{ source('sales', 'sales_salesorderheader') }}
    )

    , renamed as (
        select
            cast(salesorderid as bigint) as pk_salesorder
            , cast(customerid as bigint) as fk_customer
            , cast(territoryid as bigint) as fk_territory
            , cast(shiptoaddressid as bigint) as fk_shiptoaddress
            , coalesce(cast(creditcardid as bigint), 0) as fk_creditcard
            , cast(orderdate as date) as orderdate
            , cast(duedate as date) as duedate
            , cast(shipdate as date) as shipdate
            , cast(status as int) as status
            , cast(onlineorderflag as boolean) as onlineorderflag
            , cast(subtotal as decimal(19, 4)) as subtotal
            , cast(taxamt as decimal(19, 4)) as taxamt
            , cast(freight as decimal(19, 4)) as freight
            , cast(totaldue as decimal(19, 4)) as totaldue
        from source_salesorderheader
    )

select * from renamed
