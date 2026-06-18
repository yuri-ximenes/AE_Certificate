with
    final as (
        select * from {{ ref('stg_sales__creditcard') }}
    )

select * from final
