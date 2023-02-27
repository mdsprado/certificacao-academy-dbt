with 
    pedidos as (
        select *
        from {{ ref('stg_mds__pedidos')}}
    )
, pedidos_detalhes as (
        select *
        from {{ ref('stg_mds__detalhes_pedido')}}
    )
, enderecos as (
    select *
    from {{ ref('dim_enderecos')}}
)
, motivos_venda as (
    select *
    from {{ ref("dim_motivos_venda")}}
)

/* fan-out da tabela pedidos com os pedidos_detahes */
, joined as (
    select
        pedidos.id_pedido
        , pedidos.id_cliente
        , pedidos.id_vendedor
        , pedidos.id_territorio
        , pedidos.id_endereco_combranca
        , pedidos.id_endereco_envio
        , pedidos.id_metodo_envio
        , pedidos.id_cartao
        , pedidos_detalhes.id_detalhe_do_pedido
        , pedidos_detalhes.id_produto
        , enderecos.id_endereco
        , motivos_venda.id_motivo_venda

        , pedidos_detalhes.quantidade_pedido
        , pedidos_detalhes.preco_unitario
        , pedidos_detalhes.desconto_preco_unitario
        , pedidos.data_pedido

        , pedidos.status_pedido
        , pedidos.numero_ordem_compra
        , pedidos.numero_conta
        , pedidos.codigo_aprovacao_cartao_credito
        , pedidos.subtotal_pedido
        , pedidos.imposto_pedido
        , pedidos.frete_pedido
        , pedidos.total_devido_pedido
    from pedidos
    left join pedidos_detalhes on pedidos.id_pedido = pedidos_detalhes.id_pedido
    left join enderecos on pedidos.id_territorio= enderecos.id_territorio
    left join motivos_venda on pedidos.id_pedido = motivos_venda.id_pedido
)



select * 
from joined
            

            
            