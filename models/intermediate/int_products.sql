with
    source_products as (
        select * from {{ ref('stg_production__product') }}
    )

    , source_subcategories as (
        select * from {{ ref('stg_production__productsubcategory') }}
    )

    , source_categories as (
        select * from {{ ref('stg_production__productcategory') }}
    )

    , products_enriched as (
        select
            source_products.pk_product
            , source_products.product_name
            , source_products.listprice
            , source_products.standardcost
            , source_products.profit
            , source_subcategories.subcategory_name
            , source_categories.category_name
        from source_products
        left join source_subcategories
            on source_products.fk_productsubcategory = source_subcategories.pk_productsubcategory
        left join source_categories
            on source_subcategories.fk_productcategory = source_categories.pk_productcategory
    )

select * from products_enriched
