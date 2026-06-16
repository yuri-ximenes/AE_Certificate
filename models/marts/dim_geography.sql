with
    final as (
        select * from {{ ref('int_geography') }}
    )

select * from final
