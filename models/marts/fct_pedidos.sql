with 
    cartoes_credito as (
        select *
        from {{ ref('dim_cartoes_credito')}}
)
, clientes as (
        select *
        from {{ ref('dim_clientes')}}
)
, enderecos as (
        select *
        from {{ ref('dim_enderecos')}}
)
, motivos_venda as (
        select *
        from {{ ref('dim_motivos_venda')}}
)
, produtos as (
        select *
        from {{ ref('dim_produtos')}}
)
, pedidos_item as (
    select *
    from {{ ref('int_pedidos_item')}}
)

, joined as (
    select
        pedidos_item.id_pedido
        , cartoes_credito.pk_cartao
        , produtos.pk_produto
        , clientes.pk_cliente
        , enderecos.pk_endereco
        , motivos_venda.pk_motivo_venda
        , pedidos_item.quantidade_pedido
        , pedidos_item.preco_unitario
        , pedidos_item.desconto_preco_unitario
        , pedidos_item.subtotal_pedido
        , pedidos_item.frete_pedido
        , pedidos_item.data_pedido
        , pedidos_item.status_pedido
    from pedidos_item
    left join clientes on pedidos_item.id_cliente = clientes.id_cliente
    left join cartoes_credito on pedidos_item.id_cartao = cartoes_credito.id_cartao
    left join enderecos on pedidos_item.id_endereco = enderecos.id_endereco
    left join motivos_venda on pedidos_item.id_motivo_venda = motivos_venda.id_motivo_venda
    left join produtos on pedidos_item.id_produto = produtos.id_produto
)

, transformacoes as (
    select
         id_pedido || '-' || pk_produto as pk_pedido
        , *
    from joined

)

select * from transformacoes