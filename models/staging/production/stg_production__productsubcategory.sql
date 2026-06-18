with
    source_productsubcategory as (
        select * from {{ source('production', 'production_productsubcategory') }}
    )

    , renamed as (
        select
            cast(productsubcategoryid as bigint) as pk_productsubcategory
            , cast(productcategoryid as bigint) as fk_productcategory
            , cast(name as string) as subcategory_name
        from source_productsubcategory
    )

select * from renamed
