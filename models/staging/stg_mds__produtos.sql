with 
    source_produtos as (
        select
            cast(productid as	INTEGER) as id_produto			
            , cast(name as	STRING) as nome_produto
            , cast(color as	STRING) as cor_produto
            , cast(standardcost as	numeric) as custo_padrao_produto
            , cast(size as	STRING ) as tamanho_produto
            , cast(weight as	numeric) as peso_produto
            , cast(class as	STRING) as classe_produto
            --, productnumber
            --, makeflag
            --, finishedgoodsflag
            --, safetystocklevel
            --, reorderpoint
            --, listprice
            --, sizeunitmeasurecode
            --, weightunitmeasurecode
            --, daystomanufacture
            --, productline
            --, style
            --, productsubcategoryid
            --, productmodelid
            --, sellstartdate
            --, sellenddate
            --, discontinueddate
            --, rowguid
            --, modifieddate
        from {{ source ('mds','product')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_produtos