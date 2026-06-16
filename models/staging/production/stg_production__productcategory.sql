with
    fonte_productcategory as (
        select * from {{ source('production', 'production_productcategory') }}
    )

    , renomeado as (
        select
            productcategoryid   as pk_productcategory
            , name              as category_name
        from fonte_productcategory
    )

select * from renomeado
