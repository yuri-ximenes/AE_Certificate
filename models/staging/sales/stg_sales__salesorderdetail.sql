with
    fonte_salesorderdetail as (
        select * from {{ source('sales', 'sales_salesorderdetail') }}
    )

    , renomeado as (
        select
            salesorderdetailid                                      as pk_salesorderdetail
            , salesorderid                                          as fk_salesorder
            , productid                                             as fk_product
            , orderqty
            , unitprice
            , unitpricediscount
            , orderqty * unitprice * (1 - unitpricediscount)       as linetotal
        from fonte_salesorderdetail
    )

select * from renomeado
