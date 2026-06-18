# Adventure Works - Certificação em Engenharia de Analytics (Indicium)

Projeto de Analytics Engineering para a Adventure Works, construído com **dbt** sobre **Databricks**.

## Arquitetura do Data Warehouse

Modelo estrela (Kimball) com 1 tabela fato e 6 dimensões.

| Tabela | Tipo | Tabelas fonte |
|---|---|---|
| `fact_sales_order_details` | Fato | `sales_salesorderdetail`, `sales_salesorderheader` |
| `dim_customers` | Dimensão | `sales_customer`, `person_person` |
| `dim_products` | Dimensão | `production_product`, `production_productsubcategory`, `production_productcategory` |
| `dim_geography` | Dimensão | `person_address`, `person_stateprovince`, `person_countryregion`, `sales_salesterritory` |
| `dim_dates` | Dimensão | gerado via `dbt_utils.date_spine` — sem tabela fonte |
| `dim_credit_cards` | Dimensão | `sales_creditcard` + linha sintética `pk=0` para pedidos sem cartão |
| `dim_sales_order_reasons` | Dimensão | `sales_salesorderheadersalesreason`, `sales_salesreason` |

O diagrama conceitual editável está em [`docs/star_schema_template_pt.drawio`](docs/star_schema_template_pt.drawio).

## Stack
- **Data Warehouse**: Databricks (catalog `fea_academy`, schema fonte `adventure_works`)
- **Transformação**: dbt
- **BI**: Power BI

## Estrutura
- `models/staging`: modelos 1:1 com as tabelas fonte (renomeação, cast, limpeza) — `stg_*`
- `models/intermediate`: modelos intermediários (joins, regras de negócio) — ephemeral por padrão
- `models/marts`: dimensões (`dim_*`) e fato (`fact_*`) prontos para consumo no BI
- `tests`: testes de dados customizados (singular tests)

## Code style
Este projeto segue o [Indicium Code Style Guide](https://bitbucket.org/indiciumtech/indicium-code-style/src/master/)
(convenções dbt + SQL style guide baseado em SQLFluff 1.4.5). Destaques aplicados:
- Materialização padrão `ephemeral` (opt-in para `view`/`table` por pasta em `dbt_project.yml`)
- Schemas customizados via `macros/generate_schema_name.sql` (verbatim em prod, ignorado em dev)
- Um `schema.yml` por modelo, com descrições, testes de PK (`unique`, `not_null`) e FK (`relationships`)
- SQL: 4 espaços, linhas ≤100 colunas, vírgulas no início da linha, `inner join` explícito,
  CTEs em vez de subqueries, `as` sempre explícito (ver `.sqlfluff`)

## Como rodar
```bash
dbt deps
dbt debug
dbt run
dbt test
```
