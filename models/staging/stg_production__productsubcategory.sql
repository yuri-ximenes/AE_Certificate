with source as (
    select * from {{ source('production', 'production_productsubcategory') }}
)

, renamed as (
    select
        productsubcategoryid
        , productcategoryid
        , name as subcategory_name
    from source
)

select * from renamed
