with products as (
    select * from {{ ref('stg_production__product') }}
)

, subcategories as (
    select * from {{ ref('stg_production__productsubcategory') }}
)

, categories as (
    select * from {{ ref('stg_production__productcategory') }}
)

, final as (
    select
        products.productid
        , products.product_name
        , products.listprice
        , products.standardcost
        , products.profit
        , subcategories.subcategory_name
        , categories.category_name
    from products
    left join subcategories
        on products.productsubcategoryid = subcategories.productsubcategoryid
    left join categories
        on subcategories.productcategoryid = categories.productcategoryid
)

select * from final
