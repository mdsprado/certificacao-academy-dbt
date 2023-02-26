with 
    source_motivos_venda as (
        select
             
            cast(salesreasonid as INTEGER) as id_motivo_venda
            , cast(name as STRING) as nome_motivo_venda
            , cast(reasontype as STRING) as tipo_motivo_venda
            --, modifieddate
                            
        from {{ source ('mds','salesreason')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_motivos_venda