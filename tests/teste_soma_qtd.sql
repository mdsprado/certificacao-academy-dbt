with 
    validacao as (
        select sum(quantidade_pedido) as quantidade_total
        from {{ ref('fct_pedidos')}}
    )

select * from validacao where quantidade_total != 285460