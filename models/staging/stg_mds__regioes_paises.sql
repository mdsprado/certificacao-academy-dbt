with 
    source_regiao_pais as (
        select
            cast(countryregioncode as STRING) as codigo_regiao_pais
            , cast(name as STRING) as nome_regiao_pais
            --, modifieddate
            
        from {{ source ('mds','countryregion')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_regiao_pais