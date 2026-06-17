-- Valida vendas brutas de 2011 na camada intermediate, antes da transformação do mart.
-- Se falhar aqui, o erro está no join entre stg_sales__salesorderdetail e
-- stg_sales__salesorderheader (linhas perdidas ou duplicadas).
-- Retorna linhas quando o valor diverge → teste falha.

select
    round(sum(orderqty * unitprice), 2) as vendas_brutas_2011
from {{ ref('int_sales_order_details') }}
where year(orderdate) = 2011
having round(sum(orderqty * unitprice), 2) != 12646112.16
