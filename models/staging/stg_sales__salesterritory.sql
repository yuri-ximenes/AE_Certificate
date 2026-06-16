with source as (
    select * from {{ source('sales', 'sales_salesterritory') }}
)

, renamed as (
    select
        territoryid
        , name              as territory_name
        , countryregioncode
        , `group`           as territory_group
    from source
)

select * from renamed
