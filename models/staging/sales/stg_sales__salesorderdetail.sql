with
    source_salesorderdetail as (
        select * from {{ source('sales', 'sales_salesorderdetail') }}
    )

    , renamed as (
        select
            cast(salesorderdetailid as bigint) as pk_salesorderdetail
            , cast(salesorderid as bigint) as fk_salesorder
            , cast(productid as bigint) as fk_product
            , cast(orderqty as int) as orderqty
            , cast(unitprice as decimal(19, 4)) as unitprice
            , cast(unitpricediscount as decimal(8, 4)) as unitpricediscount
            , cast(orderqty * unitprice * (1 - unitpricediscount) as decimal(19, 4)) as linetotal
        from source_salesorderdetail
    )

select * from renamed
