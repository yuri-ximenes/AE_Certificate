with
    source_stateprovince as (
        select * from {{ source('person', 'person_stateprovince') }}
    )

    , renamed as (
        select
            cast(stateprovinceid as bigint) as pk_stateprovince
            , cast(stateprovincecode as string) as stateprovincecode
            , cast(countryregioncode as string) as fk_countryregion
            , cast(name as string) as stateprovince_name
            , cast(territoryid as bigint) as fk_territory
        from source_stateprovince
    )

select * from renamed
