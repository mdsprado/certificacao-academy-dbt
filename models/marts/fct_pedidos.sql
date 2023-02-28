with 
    pedidos_item as (
    select *
    from {{ ref('int_pedidos_itens')}}
)
, clientes as (
    select pk_cliente, id_cliente
    from {{ ref('dim_clientes')}}
)
, enderecos as (
    select pk_endereco, id_endereco
       from {{ ref('dim_enderecos')}}
)
, cartoes as (
    select pk_cartao, id_cartao
    from {{ ref('dim_cartoes_credito')}}
)

, produtos as (
    select pk_produto, id_produto
    from {{ ref('dim_produtos')}}
)
, motivos_venda as (
    select pk_motivo_venda, id_pedido
    from {{ ref('dim_motivos_venda')}}
)

, joined as (
    select
        pedidos_item.id_pedido
        , cartoes.pk_cartao
        , produtos.pk_produto
        , clientes.pk_cliente
        , enderecos.pk_endereco
        , motivos_venda.pk_motivo_venda
        , pedidos_item.id_territorio
        , pedidos_item.quantidade_pedido
        , pedidos_item.preco_unitario
        , pedidos_item.desconto_preco_unitario
        , pedidos_item.data_pedido
        , pedidos_item.status_pedido
        --, pedidos_item.id_endereco_combranca
    from pedidos_item
    left join clientes on pedidos_item.id_cliente = clientes.id_cliente
    left join cartoes on pedidos_item.id_cartao = cartoes.id_cartao
    left join enderecos on pedidos_item.id_endereco_combranca = enderecos.id_endereco
    left join motivos_venda on pedidos_item.id_pedido = motivos_venda.id_pedido
    left join produtos on pedidos_item.id_produto = produtos.id_produto
)

, transformacoes as (
    select
         id_pedido || '-' || pk_produto as pk_pedido
        , *
    from joined

)

select * from transformacoes