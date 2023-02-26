 with 
    motivos_venda as (
        select *
        from {{ ref('stg_mds__motivos_venda')}}
    )

, pedidos_motivos_venda as (
        select *
        from {{ ref('stg_mds__pedido_motivo_venda')}}
    )

, juncao_tabelas as (
    select 
        motivos_venda.id_motivo_venda
        , pedidos_motivos_venda.id_pedido
        , motivos_venda.nome_motivo_venda
        , motivos_venda.tipo_motivo_venda
    from motivos_venda
    left join pedidos_motivos_venda on motivos_venda.id_motivo_venda = pedidos_motivos_venda.id_motivo_venda
)

, transformacoes as (
    select
        row_number() over (order by id_motivo_venda) as pk_motivo_venda
        , *
    from juncao_tabelas
)

select *
from transformacoes