with
    source_countryregion as (
        select * from {{ source('person', 'person_countryregion') }}
    )

    , renamed as (
        select
            cast(countryregioncode as string) as pk_countryregion
            , cast(name as string) as country_name
        from source_countryregion
    )

select * from renamed
