with
    fonte_produtos as (
        select * from {{ ref('stg_production__product') }}
    )

    , fonte_subcategorias as (
        select * from {{ ref('stg_production__productsubcategory') }}
    )

    , fonte_categorias as (
        select * from {{ ref('stg_production__productcategory') }}
    )

    , produtos_enriquecido as (
        select
            fonte_produtos.pk_product
            , fonte_produtos.product_name
            , fonte_produtos.listprice
            , fonte_produtos.standardcost
            , fonte_produtos.profit
            , fonte_subcategorias.subcategory_name
            , fonte_categorias.category_name
        from fonte_produtos
        left join fonte_subcategorias
            on fonte_produtos.fk_productsubcategory = fonte_subcategorias.pk_productsubcategory
        left join fonte_categorias
            on fonte_subcategorias.fk_productcategory = fonte_categorias.pk_productcategory
    )

select * from produtos_enriquecido
