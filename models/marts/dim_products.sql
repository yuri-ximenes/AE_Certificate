with final as (
    select * from {{ ref('int_products') }}
)

select * from final
