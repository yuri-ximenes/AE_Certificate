with
    source_addresses as (
        select * from {{ ref('stg_person__address') }}
    )

    , source_states as (
        select * from {{ ref('stg_person__stateprovince') }}
    )

    , source_countries as (
        select * from {{ ref('stg_person__countryregion') }}
    )

    , geography_enriched as (
        select
            source_addresses.pk_address
            , source_addresses.city
            , source_states.stateprovincecode
            , source_states.stateprovince_name
            , source_countries.pk_countryregion as countryregioncode
            , source_countries.country_name
        from source_addresses
        inner join source_states
            on source_addresses.fk_stateprovince = source_states.pk_stateprovince
        inner join source_countries
            on source_states.fk_countryregion = source_countries.pk_countryregion
    )

select * from geography_enriched
