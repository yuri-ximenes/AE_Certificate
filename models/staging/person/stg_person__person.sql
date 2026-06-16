with
    fonte_person as (
        select * from {{ source('person', 'person_person') }}
    )

    , renomeado as (
        select
            businessentityid    as pk_person
            , persontype
            , firstname
            , middlename
            , lastname
            , title
        from fonte_person
    )

select * from renomeado
