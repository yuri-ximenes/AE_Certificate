with
    source_product as (
        select * from {{ source('production', 'production_product') }}
    )

    , renamed as (
        select
            cast(productid as bigint) as pk_product
            , cast(name as string) as product_name
            , cast(listprice as decimal(19, 4)) as listprice
            , cast(standardcost as decimal(19, 4)) as standardcost
            , cast(listprice - standardcost as decimal(19, 4)) as profit
            , cast(productsubcategoryid as bigint) as fk_productsubcategory
        from source_product
    )

select * from renamed
