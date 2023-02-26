with 
    dource_enderecos as (
        select
             
            cast(addressid as INTEGER) AS id_endereco
            , cast(addressline1 as STRING) AS linha1_endereco
            , cast(addressline2 as STRING) AS linha2_endereco
            , cast(city as STRING) AS cidade
            , cast(stateprovinceid as INTEGER) AS estado_provincia
            , cast(postalcode as STRING) AS cep_endereco
            --, spatiallocation
            --, rowguid
            --, modifieddate
        from {{ source ('mds','address')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from dource_enderecos