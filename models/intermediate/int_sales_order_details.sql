with
    fonte_itens as (
        select * from {{ ref('stg_sales__salesorderdetail') }}
    )

    , fonte_cabecalho as (
        select * from {{ ref('stg_sales__salesorderheader') }}
    )

    , fonte_cartao as (
        select * from {{ ref('stg_sales__creditcard') }}
    )

    , final as (
        select
            fonte_itens.pk_salesorderdetail
            , fonte_itens.fk_salesorder
            , fonte_cabecalho.fk_customer
            , fonte_itens.fk_product
            , fonte_cabecalho.fk_shiptoaddress              as fk_address
            , cast(fonte_cabecalho.orderdate as date)       as orderdate
            , fonte_itens.orderqty
            , fonte_itens.unitprice
            , fonte_itens.unitpricediscount
            , fonte_itens.linetotal
            , fonte_cabecalho.subtotal
            , fonte_cabecalho.taxamt
            , fonte_cabecalho.freight
            , fonte_cabecalho.totaldue
            , fonte_cabecalho.status
            , fonte_cabecalho.onlineorderflag
            , fonte_cartao.card_type
        from fonte_itens
        inner join fonte_cabecalho
            on fonte_itens.fk_salesorder = fonte_cabecalho.pk_salesorder
        left join fonte_cartao
            on fonte_cabecalho.fk_creditcard = fonte_cartao.pk_creditcard
    )

select * from final
