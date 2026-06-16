with final as (
    select * from {{ ref('int_sales_order_reasons') }}
)

select * from final
