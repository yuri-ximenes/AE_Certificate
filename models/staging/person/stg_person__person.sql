with
    source_person as (
        select * from {{ source('person', 'person_person') }}
    )

    , renamed as (
        select
            cast(businessentityid as bigint) as pk_person
            , cast(persontype as string) as persontype
            , cast(firstname as string) as firstname
            , cast(middlename as string) as middlename
            , cast(lastname as string) as lastname
            , cast(title as string) as title
        from source_person
    )

select * from renamed
