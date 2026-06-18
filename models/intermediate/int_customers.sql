with
    source_customers as (
        select * from {{ ref('stg_sales__customer') }}
    )

    , source_persons as (
        select * from {{ ref('stg_person__person') }}
    )

    , customers_enriched as (
        select
            source_customers.pk_customer
            , source_persons.firstname
            , source_persons.middlename
            , source_persons.lastname
            , source_persons.title
            , source_persons.persontype
        from source_customers
        inner join source_persons
            on source_customers.fk_person = source_persons.pk_person
    )

select * from customers_enriched
