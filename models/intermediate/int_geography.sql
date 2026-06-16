with
    fonte_enderecos as (
        select * from {{ ref('stg_person__address') }}
    )

    , fonte_estados as (
        select * from {{ ref('stg_person__stateprovince') }}
    )

    , fonte_paises as (
        select * from {{ ref('stg_person__countryregion') }}
    )

    , fonte_territorios as (
        select * from {{ ref('stg_sales__salesterritory') }}
    )

    , geografia_enriquecida as (
        select
            fonte_enderecos.pk_address
            , fonte_enderecos.city
            , fonte_estados.stateprovincecode
            , fonte_estados.stateprovince_name
            , fonte_paises.pk_countryregion         as countryregioncode
            , fonte_paises.country_name
            , fonte_territorios.territory_name
            , fonte_territorios.territory_group
        from fonte_enderecos
        inner join fonte_estados
            on fonte_enderecos.fk_stateprovince = fonte_estados.pk_stateprovince
        inner join fonte_paises
            on fonte_estados.fk_countryregion = fonte_paises.pk_countryregion
        left join fonte_territorios
            on fonte_estados.fk_territory = fonte_territorios.pk_territory
    )

select * from geografia_enriquecida
