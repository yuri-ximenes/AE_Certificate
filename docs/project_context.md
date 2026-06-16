# Contexto do Projeto — Indicium AE Certificate (Adventure Works)

## Stack
- **Fonte**: AdventureWorks (PostgreSQL → Databricks via EL já realizado)
- **DW**: Databricks Unity Catalog — catalog `fea_academy`, schema `adventure_works`
- **dbt**: dbt-fusion 2.0.0-preview (Rust engine), conta `ut515.us1.dbt.com`
- **BI**: Power BI
- **Repositório**: `https://github.com/yuri-ximenes/AE_Certificate.git` (branch `main`)
- **Projeto local**: `~/adventure-works-dbt` (WSL Ubuntu)

## Conexão dbt
- Profile: `adventure_works` em `~/.dbt/profiles.yml`
- Host: `dbc-b4573e3a-f005.cloud.databricks.com`
- HTTP path: `/sql/1.0/warehouses/d87e67fc727fee25`
- Dev schema: `dbt_yuriximenes`
- Token via `env_var('DBT_DATABRICKS_TOKEN')` — carregado via `source ~/.dbt/env.sh`
- Tabelas fonte no Databricks: prefixo `<schema_origem>_<tabela>` (ex: `sales_salesorderdetail`)

## Convenção de código
Guia Indicium: `https://bitbucket.org/indiciumtech/indicium-code-style/src/master/`
- Prefixos: `stg_`, `dim_`, `fact_`, `agg_`, `bridge_`
- Um `schema.yml` por modelo (mesmo nome do arquivo .sql)
- Sources: um arquivo `<source_name>.yml` por grupo de tabelas
- SQL: CTEs, leading commas, 4 espaços, 100 chars, lowercase keywords
- Materialização padrão: `ephemeral` (staging: `view`, marts: `table`)

## Modelo estrela (Fase 1 — CONCLUÍDA)
Diagrama: `docs/star_schema_template_pt.drawio` / `docs/star_schema_template_AE.pdf`

| Modelo | Grão | Fontes principais |
|---|---|---|
| `fact_sales_order_details` | 1 item do pedido | `sales_salesorderdetail` + `sales_salesorderheader` |
| `dim_products` | 1 produto | `production_product` + subcategory + category |
| `dim_customers` | 1 cliente (pessoa física) | `sales_customer` + `person_person` (via personid) |
| `dim_geography` | 1 endereço de entrega (ship-to) | `person_address` + stateprovince + countryregion + salesterritory |
| `dim_dates` | 1 data | gerada via date spine (off orderdate) |
| `dim_sales_order_reasons` | 1 pedido (motivos agregados) | `sales_salesorderheadersalesreason` + `sales_salesreason` → GROUP BY salesorderid, collect_set + concat_ws |

**Decisões importantes:**
- PK do fato: surrogate key (hash de `salesorderid` + `salesorderdetailid`)
- Geografia via endereço de **entrega** (ship-to), não cobrança
- Clientes loja/B2B (`personid` nulo) fora do escopo
- `dim_sales_order_reasons`: 1 linha por pedido (motivos agregados em string), relação 1:N com fato — elimina fan-out do M:N original

## Progresso atual — Fase 2 (Sources + Staging)
Arquivos criados (vazios, aguardando preenchimento pelo usuário):
- `models/staging/sales.yml` — 6 tabelas sales_*
- `models/staging/production.yml` — 3 tabelas production_*
- `models/staging/person.yml` — 4 tabelas person_*

Tabelas fonte por arquivo:

**sales.yml**: `sales_salesorderdetail`, `sales_salesorderheader`, `sales_customer`,
`sales_salesorderheadersalesreason`, `sales_salesreason`, `sales_salesterritory`

**production.yml**: `production_product`, `production_productsubcategory`, `production_productcategory`

**person.yml**: `person_person`, `person_address`, `person_stateprovince`, `person_countryregion`

## Instrução importante
O usuário escreve todo o código dbt/SQL. O assistente apenas guia, explica e revisa.
