
with 
    pedidos as (
        select id_pedido
        , id_cliente
        , id_territorio
        , id_cartao
        , data_pedido
        , status_pedido
        , id_endereco_combranca
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
/*, enderecos as (
    select id_endereco, id_territorio,pk_endereco
    from {{ ref('dim_enderecos')}}
)
, motivos_venda as (
    select id_motivo_venda, id_pedido, pk_motivo_venda
    from {{ ref("dim_motivos_venda")}}
)*/

/* fan-out da tabela pedidos com os pedidos_detahes */
, joined as (
    select
        pedidos.id_pedido
        , pedidos.id_cliente
        , pedidos.id_territorio
        , pedidos.id_cartao
        , pedidos_detalhes.id_produto
        , pedidos_detalhes.quantidade_pedido
        , pedidos_detalhes.preco_unitario
        , pedidos_detalhes.desconto_preco_unitario
        , pedidos.data_pedido
        , pedidos.id_endereco_combranca

        , pedidos.status_pedido
    from pedidos
    left join pedidos_detalhes on pedidos.id_pedido = pedidos_detalhes.id_pedido
)



select *--COUNT(id_pedido)
from joined
            

            
            