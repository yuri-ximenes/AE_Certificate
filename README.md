# Adventure Works - Certificação em Engenharia de Analytics (Indicium)

Projeto de Analytics Engineering para a Adventure Works, construído com **dbt** sobre **Databricks**.

## Stack
- **Data Warehouse**: Databricks (catalog `fea_academy`, schema fonte `adventure_works`)
- **Transformação**: dbt
- **BI**: Power BI

## Estrutura
- `models/staging`: modelos 1:1 com as tabelas fonte (renomeação, cast, limpeza)
- `models/intermediate`: modelos intermediários (joins, regras de negócio)
- `models/marts`: dimensões (`dim_*`) e fato (`fct_*`) prontos para consumo no BI
- `tests`: testes de dados customizados (singular tests)

## Como rodar
```bash
dbt deps
dbt debug
dbt run
dbt test
```
