with
    fonte_productsubcategory as (
        select * from {{ source('production', 'production_productsubcategory') }}
    )

    , renomeado as (
        select
            productsubcategoryid    as pk_productsubcategory
            , productcategoryid     as fk_productcategory
            , name                  as subcategory_name
        from fonte_productsubcategory
    )

select * from renomeado
