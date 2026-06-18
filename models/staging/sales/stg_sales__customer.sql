with
    source_customer as (
        select * from {{ source('sales', 'sales_customer') }}
    )

    , renamed as (
        select
            cast(customerid as bigint) as pk_customer
            , cast(personid as bigint) as fk_person
            , cast(storeid as bigint) as fk_store
            , cast(territoryid as bigint) as fk_territory
        from source_customer
        where personid is not null
    )

select * from renamed
