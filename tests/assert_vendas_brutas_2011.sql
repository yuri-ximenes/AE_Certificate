-- Teste solicitado pelo CEO Carlos Silveira: as vendas brutas de 2011 devem totalizar
-- exatamente $12.646.112,16 conforme levantamento da equipe de auditoria da contabilidade.
-- Vendas brutas = orderqty * unitprice, sem aplicação de desconto.
-- Retorna linhas quando o valor diverge → teste falha.

select
    round(sum(gross_linetotal), 2) as vendas_brutas_2011
from {{ ref('fact_sales_order_details') }}
where year(orderdate) = 2011
having round(sum(gross_linetotal), 2) != 12646112.16
