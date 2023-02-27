
with 
    pedidos_itens as (
        select *
        from {{ref('int_pedidos_itens')}}
    )
, enderecos as (
    select id_endereco, id_territorio
    from {{ ref('dim_enderecos')}}
)
, motivos_venda as (
    select id_motivo_venda, id_pedido
    from {{ ref("dim_motivos_venda")}}
)

/* fan-out da tabela pedidos com os pedidos_detahes */
, joined as (
    select
        pedidos_itens.id_pedido
        , pedidos_itens.id_cliente
        , pedidos_itens.id_vendedor
        , pedidos_itens.id_territorio
        --, pedidos_itens.id_endereco_combranca
        --, pedidos_itens.id_endereco_envio
        --, pedidos_itens.id_metodo_envio
        , pedidos_itens.id_cartao
        , pedidos_itens.id_detalhe_do_pedido
        , pedidos_itens.id_produto
        , enderecos.id_endereco
        , motivos_venda.id_motivo_venda

        , pedidos_itens.quantidade_pedido
        , pedidos_itens.preco_unitario
        , pedidos_itens.desconto_preco_unitario
        , pedidos_itens.data_pedido

        , pedidos_itens.status_pedido
        --, pedidos.subtotal_pedido
        --, pedidos.imposto_pedido
        --, pedidos.frete_pedido
        --, pedidos.total_devido_pedido
    from pedidos_itens
    --left join pedidos_itens on pedidos.id_pedido = pedidos_detalhes.id_pedido
    left join enderecos on pedidos_itens.id_territorio= enderecos.id_territorio
    left join motivos_venda on pedidos_itens.id_pedido = motivos_venda.id_pedido
)



select *--COUNT(id_pedido)
from joined
            

            
            