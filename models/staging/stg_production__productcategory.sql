with source as (
    select * from {{ source('production', 'production_productcategory') }}
)

, renamed as (
    select
        productcategoryid
        , name as category_name
    from source
)

select * from renamed
