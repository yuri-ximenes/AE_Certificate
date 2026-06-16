with
    fonte_stateprovince as (
        select * from {{ source('person', 'person_stateprovince') }}
    )

    , renomeado as (
        select
            stateprovinceid         as pk_stateprovince
            , stateprovincecode
            , countryregioncode     as fk_countryregion
            , name                  as stateprovince_name
            , territoryid           as fk_territory
        from fonte_stateprovince
    )

select * from renomeado
