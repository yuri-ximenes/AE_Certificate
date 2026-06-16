with
    fonte_product as (
        select * from {{ source('production', 'production_product') }}
    )

    , renomeado as (
        select
            productid                           as pk_product
            , name                              as product_name
            , listprice
            , standardcost
            , listprice - standardcost          as profit
            , productsubcategoryid              as fk_productsubcategory
        from fonte_product
    )

select * from renomeado
