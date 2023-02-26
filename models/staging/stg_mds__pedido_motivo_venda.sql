with 
    source_pedidos_motivos_venda as (
        select
             
            cast(salesorderid as INTEGER) as id_pedido
            , cast(salesreasonid as INTEGER) as  id_motivo_venda
            --, modifieddate 
                            
        from {{ source ('mds','salesorderheadersalesreason')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_pedidos_motivos_venda