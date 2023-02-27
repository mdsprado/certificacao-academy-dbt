
with 
    pedidos as (
        select id_pedido
        , id_cliente
        , id_vendedor
        , id_territorio
        --, id_endereco_combranca
        --, id_endereco_envio
        --, id_metodo_envio
        , id_cartao
        , data_pedido
        , status_pedido
        --, subtotal_pedido
        --, imposto_pedido
        --, frete_pedido
        --, total_devido_pedido
        from {{ ref('stg_mds__pedidos')}}
    )
, pedidos_detalhes as (
        select 
            id_detalhe_do_pedido
            , id_pedido
            , id_produto
            , quantidade_pedido
            , preco_unitario
            , desconto_preco_unitario
        from {{ ref('stg_mds__detalhes_pedido')}}
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
        pedidos.id_pedido
        , pedidos.id_cliente
        , pedidos.id_vendedor
        , pedidos.id_territorio
        --, pedidos.id_endereco_combranca
        --, pedidos.id_endereco_envio
        --, pedidos.id_metodo_envio
        , pedidos.id_cartao
        , pedidos_detalhes.id_detalhe_do_pedido
        , pedidos_detalhes.id_produto
        --, enderecos.id_endereco
        --, motivos_venda.id_motivo_venda

        , pedidos_detalhes.quantidade_pedido
        , pedidos_detalhes.preco_unitario
        , pedidos_detalhes.desconto_preco_unitario
        , pedidos.data_pedido

        , pedidos.status_pedido
        --, pedidos.subtotal_pedido
        --, pedidos.imposto_pedido
        --, pedidos.frete_pedido
        --, pedidos.total_devido_pedido
    from pedidos
    left join pedidos_detalhes on pedidos.id_pedido = pedidos_detalhes.id_pedido
    --left join enderecos on pedidos.id_territorio= enderecos.id_territorio
    --left join motivos_venda on pedidos.id_pedido = motivos_venda.id_pedido
)



select *--COUNT(id_pedido)
from joined
            

            
            