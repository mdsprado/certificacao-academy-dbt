with 
    provincias as (
        select *
        from {{ ref('stg_mds__estado_provincias')}}
)
    , enderecos as (
        select *
        from {{ ref('stg_mds__enderecos')}}
)

    , paises as (
        select *
        from {{ ref('stg_mds__regioes_paises')}}
    )

, juncao_tabelas1 as (
    select
        enderecos.id_endereco
        , provincias.id_estado_provincia
        , enderecos.linha1_endereco
        , enderecos.linha2_endereco
        , enderecos.cidade
        , enderecos.cep_endereco
        , provincias.codigo_estado_provincia
        , provincias.codigo_regiao_pais
        , provincias.nome_estado_provincia
        , provincias.id_territorio
    from
    enderecos
    left join provincias on enderecos.id_estado_provincia=provincias.id_estado_provincia
)

, juncao_tabelas2 as (
    select
        juncao_tabelas1.id_endereco
        , juncao_tabelas1.id_estado_provincia
        , juncao_tabelas1.linha1_endereco
        , juncao_tabelas1.linha2_endereco
        , juncao_tabelas1.cidade
        , juncao_tabelas1.cep_endereco
        , juncao_tabelas1.codigo_estado_provincia
        , juncao_tabelas1.codigo_regiao_pais
        , juncao_tabelas1.nome_estado_provincia
        , juncao_tabelas1.id_territorio
        , paises.nome_regiao_pais
    from
    juncao_tabelas1
    left join paises on juncao_tabelas1.codigo_regiao_pais = paises.codigo_regiao_pais
)

,transformacoes as (
    select
        row_number() over (order by id_endereco) as pk_endereco
        , *
    from juncao_tabelas2
)

select *
from transformacoes