with 
    source_detalhes_pedido as (
        select
            cast(salesorderid AS INTEGER) AS id_pedido
            , cast(salesorderdetailid AS INTEGER) AS id_detalhe_do_pedido
            , cast(productid AS INTEGER) AS id_produto
            , cast(orderqty AS INTEGER) AS quantidade_pedido
            , cast(unitprice AS NUMERIC) AS preco_unitario
            , cast(unitpricediscount AS NUMERIC) AS desconto_preco_unitario
            --, carriertrackingnumber
            --, specialofferid
            --, rowguid
            --, modifieddate
            
        from {{ source ('mds','salesorderdetail')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_detalhes_pedido