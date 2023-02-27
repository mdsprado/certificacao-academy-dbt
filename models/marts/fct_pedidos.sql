with 
    pedidos_item as (
    select id_pedido
        , quantidade_pedido
        , preco_unitario
        , desconto_preco_unitario
        , subtotal_pedido
        , frete_pedido
        , data_pedido
        , status_pedido
    from {{ ref('int_pedidos_itens')}}
)
, ids_dim as (
    select *
    from {{ ref('int_ids_dim')}}
)

, joined as (
    select
        pedidos_item.id_pedido
        , ids_dim.pk_cartao
        , ids_dim.pk_produto
        , ids_dim.pk_cliente
        , ids_dim.pk_endereco
        , ids_dim.pk_motivo_venda
        , pedidos_item.quantidade_pedido
        , pedidos_item.preco_unitario
        , pedidos_item.desconto_preco_unitario
        , pedidos_item.subtotal_pedido
        , pedidos_item.frete_pedido
        , pedidos_item.data_pedido
        , pedidos_item.status_pedido
    from pedidos_item
    left join ids_dim on pedidos_item.id_pedido = ids_dim.id_pedido
    --left join cartoes_credito on pedidos_item.id_cartao = cartoes_credito.id_cartao
    --left join enderecos on pedidos_item.id_endereco = enderecos.id_endereco
    --left join motivos_venda on pedidos_item.id_motivo_venda = motivos_venda.id_motivo_venda
    --left join produtos on pedidos_item.id_produto = produtos.id_produto
)

, transformacoes as (
    select
         id_pedido || '-' || pk_produto as pk_pedido
        , *
    from joined

)

select * from transformacoes