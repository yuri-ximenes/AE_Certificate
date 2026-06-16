with int_sales as (
    select * from {{ ref('int_sales_order_details') }}
)

, final as (
    select
        {{
            dbt_utils.generate_surrogate_key(['salesorderid', 'salesorderdetailid'])
        }} as sales_order_detail_key
        , salesorderid
        , salesorderdetailid
        , customerid
        , productid
        , addressid
        , orderdate
        , orderqty
        , unitprice
        , unitpricediscount
        , linetotal
        , subtotal
        , taxamt
        , freight
        , totaldue
        , status
        , onlineorderflag
    from int_sales
)

select * from final
