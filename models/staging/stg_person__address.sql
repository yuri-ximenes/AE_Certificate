with source as (
    select * from {{ source('person', 'person_address') }}
)

, renamed as (
    select
        addressid
        , city
        , stateprovinceid
    from source
)

select * from renamed
