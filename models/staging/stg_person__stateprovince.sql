with source as (
    select * from {{ source('person', 'person_stateprovince') }}
)

, renamed as (
    select
        stateprovinceid
        , stateprovincecode
        , countryregioncode
        , name as stateprovince_name
        , territoryid
    from source
)

select * from renamed
