
with 
    motivos_venda as (
        select id_motivo_venda, pk_motivo_venda
        from {{ ref('dim_motivos_venda')}}
)
, produtos as (
        select id_produto,pk_produto
        from {{ ref('dim_produtos')}}
)
, ids_dim_1 as (
    select *
    from {{ ref('int_ids_dim2')}}
)

, pedidos_item as (
    select 
        id_pedido
        , id_cliente
        , id_cartao
        , id_endereco
        , id_motivo_venda
        , id_produto

    from {{ ref('int_pedidos_itens')}}
)
, joined as (
    select
        ids_dim_1.id_pedido
        , ids_dim_1.pk_cliente
        , ids_dim_1.pk_cartao
        , ids_dim_1.pk_endereco
        , motivos_venda.pk_motivo_venda
        , produtos.pk_produto
    from pedidos_item
    inner join ids_dim_1 on pedidos_item.id_pedido = ids_dim_1.id_pedido
    inner join motivos_venda on pedidos_item.id_motivo_venda = motivos_venda.id_motivo_venda
    inner join produtos on pedidos_item.id_produto = produtos.id_produto
)

select * from joined