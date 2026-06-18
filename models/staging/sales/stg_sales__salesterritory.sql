with
    source_salesterritory as (
        select * from {{ source('sales', 'sales_salesterritory') }}
    )

    , renamed as (
        select
            cast(territoryid as bigint) as pk_territory
            , cast(name as string) as territory_name
            , cast(countryregioncode as string) as fk_countryregion
            , cast(`group` as string) as territory_group
        from source_salesterritory
    )

select * from renamed
