with
    fonte_clientes as (
        select * from {{ ref('stg_sales__customer') }}
    )

    , fonte_pessoas as (
        select * from {{ ref('stg_person__person') }}
    )

    , clientes_enriquecido as (
        select
            fonte_clientes.pk_customer
            , fonte_pessoas.firstname
            , fonte_pessoas.middlename
            , fonte_pessoas.lastname
            , fonte_pessoas.title
            , fonte_pessoas.persontype
        from fonte_clientes
        inner join fonte_pessoas
            on fonte_clientes.fk_person = fonte_pessoas.pk_person
    )

select * from clientes_enriquecido
