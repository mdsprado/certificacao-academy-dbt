
with 
    cartoes_credito as (
        select pk_cartao
            , id_cartao
        from {{ ref('dim_cartoes_credito')}}
)
, clientes as (
        select pk_cliente, id_cliente
        from {{ ref('dim_clientes')}}
)
, enderecos as (
        select id_endereco, pk_endereco
        from {{ ref('dim_enderecos')}}
)
/*, motivos_venda as (
        select id_motivo_venda, pk_motivo_venda
        from {{ ref('dim_motivos_venda')}}
)
, produtos as (
        select id_produto,pk_produto
        from {{ ref('dim_produtos')}}
)*/
, pedidos_item as (
    select 
        id_pedido
        , id_cliente
        , id_cartao
        , id_endereco
        --, id_motivo_venda
        --, id_produto

    from {{ ref('int_pedidos_itens')}}
)
, joined as (
    select
        pedidos_item.id_pedido
        , clientes.pk_cliente
        , cartoes_credito.pk_cartao
        , enderecos.pk_endereco
        --, motivos_venda.pk_motivo_venda
        --, produtos.pk_produto
        
        
        
    from pedidos_item
    inner join clientes on pedidos_item.id_cliente = clientes.id_cliente
    inner join cartoes_credito on pedidos_item.id_cartao = cartoes_credito.id_cartao
    inner join enderecos on pedidos_item.id_endereco = enderecos.id_endereco
    --inner join motivos_venda on pedidos_item.id_motivo_venda = motivos_venda.id_motivo_venda
    --inner join produtos on pedidos_item.id_produto = produtos.id_produto
)

select * from joined