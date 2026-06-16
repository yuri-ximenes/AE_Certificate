with source as (
    select * from {{ source('person', 'person_countryregion') }}
)

, renamed as (
    select
        countryregioncode
        , name as country_name
    from source
)

select * from renamed
