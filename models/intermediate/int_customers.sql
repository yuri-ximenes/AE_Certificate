with customers as (
    select * from {{ ref('stg_sales__customer') }}
)

, persons as (
    select * from {{ ref('stg_person__person') }}
)

, final as (
    select
        customers.customerid
        , persons.firstname
        , persons.middlename
        , persons.lastname
        , persons.title
        , persons.persontype
    from customers
    inner join persons
        on customers.personid = persons.businessentityid
)

select * from final
