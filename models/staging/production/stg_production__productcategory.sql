with
    source_productcategory as (
        select * from {{ source('production', 'production_productcategory') }}
    )

    , renamed as (
        select
            cast(productcategoryid as bigint) as pk_productcategory
            , cast(name as string) as category_name
        from source_productcategory
    )

select * from renamed
