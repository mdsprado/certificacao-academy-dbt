with 
    source_estados_provincia as (
        select
            cast(stateprovinceid as INTEGER) AS id_estado_provincia
            , cast(stateprovincecode as STRING) AS codigo_estado_provincia
            , cast(countryregioncode as STRING) AS codigo_regiao_pais
            , cast(name as STRING) AS nome_estado_provincia
            , cast(territoryid as INTEGER ) AS id_territorio
            --, isonlystateprovinceflag
            --, rowguid
            --, modifieddate
        from {{ source ('mds','stateprovince')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_estados_provincia