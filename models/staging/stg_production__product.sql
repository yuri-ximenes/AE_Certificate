with source as (
    select * from {{ source('production', 'production_product') }}
)

, renamed as (
    select
        productid
        , name                          as product_name
        , listprice
        , standardcost
        , listprice - standardcost      as profit
        , productsubcategoryid
    from source
)

select * from renamed
