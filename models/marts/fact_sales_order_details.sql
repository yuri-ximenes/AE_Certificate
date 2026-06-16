with order_details as (
    select * from {{ ref('stg_sales__salesorderdetail') }}
)

, order_headers as (
    select * from {{ ref('stg_sales__salesorderheader') }}
)

, final as (
    select
        {{ dbt_utils.generate_surrogate_key([
            'order_details.salesorderid',
            'order_details.salesorderdetailid'
        ]) }}                                           as sales_order_detail_key
        , order_details.salesorderid
        , order_details.salesorderdetailid
        , order_headers.customerid
        , order_details.productid
        , order_headers.shiptoaddressid                as addressid
        , cast(order_headers.orderdate as date)        as orderdate
        , order_details.orderqty
        , order_details.unitprice
        , order_details.unitpricediscount
        , order_details.linetotal
        , order_headers.subtotal
        , order_headers.taxamt
        , order_headers.freight
        , order_headers.totaldue
        , order_headers.status
        , order_headers.onlineorderflag
    from order_details
    inner join order_headers
        on order_details.salesorderid = order_headers.salesorderid
)

select * from final
