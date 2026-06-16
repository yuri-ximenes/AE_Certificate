with
    fonte_countryregion as (
        select * from {{ source('person', 'person_countryregion') }}
    )

    , renomeado as (
        select
            countryregioncode   as pk_countryregion
            , name              as country_name
        from fonte_countryregion
    )

select * from renomeado
