with
    source_address as (
        select * from {{ source('person', 'person_address') }}
    )

    , renamed as (
        select
            cast(addressid as bigint) as pk_address
            , cast(city as string) as city
            , cast(stateprovinceid as bigint) as fk_stateprovince
        from source_address
    )

select * from renamed
