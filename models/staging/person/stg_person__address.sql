with
    fonte_address as (
        select * from {{ source('person', 'person_address') }}
    )

    , renomeado as (
        select
            addressid           as pk_address
            , city
            , stateprovinceid   as fk_stateprovince
        from fonte_address
    )

select * from renomeado
