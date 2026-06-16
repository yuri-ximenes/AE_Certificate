with source as (
    select * from {{ source('person', 'person_person') }}
)

, renamed as (
    select
        businessentityid
        , persontype
        , firstname
        , middlename
        , lastname
        , title
    from source
)

select * from renamed
