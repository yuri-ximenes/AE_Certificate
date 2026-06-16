with
    final as (
        select * from {{ ref('int_customers') }}
    )

select * from final
