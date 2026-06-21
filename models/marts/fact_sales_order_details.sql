with
    source_sales as (
        select * from {{ ref('int_sales_order_details') }}
    )

    , final as (
        select
            {{
                dbt_utils.generate_surrogate_key(['pk_salesorderdetail', 'fk_salesorder'])
            }} as pk_fact_sales_order_detail
            , pk_salesorderdetail
            , fk_salesorder
            , fk_customer
            , fk_product
            , fk_address
            , fk_creditcard
            , orderdate
            , orderqty
            , unitprice
            , unitpricediscount
            , orderqty * unitprice as gross_linetotal
            , linetotal
            , subtotal
            , taxamt
            , freight
            , totaldue
            , status
            , onlineorderflag
        from source_sales
    )

select * from final
