with
    fonte_salesterritory as (
        select * from {{ source('sales', 'sales_salesterritory') }}
    )

    , renomeado as (
        select
            territoryid             as pk_territory
            , name                  as territory_name
            , countryregioncode     as fk_countryregion
            , `group`               as territory_group
        from fonte_salesterritory
    )

select * from renomeado
