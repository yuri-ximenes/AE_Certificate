with addresses as (
    select * from {{ ref('stg_person__address') }}
)

, stateprovinces as (
    select * from {{ ref('stg_person__stateprovince') }}
)

, countries as (
    select * from {{ ref('stg_person__countryregion') }}
)

, territories as (
    select * from {{ ref('stg_sales__salesterritory') }}
)

, final as (
    select
        addresses.addressid
        , addresses.city
        , stateprovinces.stateprovincecode
        , stateprovinces.stateprovince_name
        , countries.countryregioncode
        , countries.country_name
        , territories.territory_name
        , territories.territory_group
    from addresses
    inner join stateprovinces
        on addresses.stateprovinceid = stateprovinces.stateprovinceid
    inner join countries
        on stateprovinces.countryregioncode = countries.countryregioncode
    left join territories
        on stateprovinces.territoryid = territories.territoryid
)

select * from final
