with
    fonte_customer as (
        select * from {{ source('sales', 'sales_customer') }}
    )

    , renomeado as (
        select
            customerid      as pk_customer
            , personid      as fk_person
            , storeid       as fk_store
            , territoryid   as fk_territory
        from fonte_customer
        where personid is not null
    )

select * from renomeado
