with
    fonte_salesorderheader as (
        select * from {{ source('sales', 'sales_salesorderheader') }}
    )

    , renomeado as (
        select
            salesorderid            as pk_salesorder
            , customerid            as fk_customer
            , territoryid           as fk_territory
            , shiptoaddressid       as fk_shiptoaddress
            , coalesce(cast(creditcardid as bigint), 0)  as fk_creditcard
            , orderdate
            , duedate
            , shipdate
            , status
            , onlineorderflag
            , subtotal
            , taxamt
            , freight
            , totaldue
        from fonte_salesorderheader
    )

select * from renomeado
