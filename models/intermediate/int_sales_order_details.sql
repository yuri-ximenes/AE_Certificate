with
    source_items as (
        select * from {{ ref('stg_sales__salesorderdetail') }}
    )

    , source_header as (
        select * from {{ ref('stg_sales__salesorderheader') }}
    )

    , final as (
        select
            source_items.pk_salesorderdetail
            , source_items.fk_salesorder
            , source_header.fk_customer
            , source_items.fk_product
            , source_header.fk_shiptoaddress as fk_address
            , source_header.fk_creditcard
            , source_header.orderdate
            , source_items.orderqty
            , source_items.unitprice
            , source_items.unitpricediscount
            , source_items.linetotal
            , source_header.subtotal
            , source_header.taxamt
            , source_header.freight
            , source_header.totaldue
            , source_header.onlineorderflag
        from source_items
        inner join source_header
            on source_items.fk_salesorder = source_header.pk_salesorder
    )

select * from final
