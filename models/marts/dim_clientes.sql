 with 
    clientes as (
        select 
            *
        from {{ ref('stg_mds__clientes')}}
    )
, 
    pessoas as (
        select 
            *
        from {{ ref('stg_mds__pessoas')}}
    )
, entidades as (
    select * 
    from {{ ref('stg_mds__entidade_comercial')}}
), lojas as (
    select * 
    from {{ ref('stg_mds__lojas')}}
)

, juncao as (
    select 
        id_entidade, clientes.*
        --clientes.id_cliente
        --, entidades.id_entidade
        --, tipo_pessoa
        --, nome_completo
    from clientes
    --left join entidades on pessoas.id_entidade = entidades.id_entidade
    left join entidades on clientes.id_pessoa = entidades.id_pessoa
)
, juncao2 as (
    select juncao.id_entidade
        , id_cliente
        , id_pessoa
        , id_loja
        , id_territorio
        , tipo_pessoa
        , nome_completo
        , lojas.nome_loja
    from juncao
    left join pessoas on juncao.id_pessoa = pessoas.id_entidade
    left join lojas on juncao.id_entidade = lojas.id_entidade
)


, transformacoes as (
    select
        row_number() over (order by id_cliente) as pk_cliente
        , *
    from juncao2
)

/*SELECT count(distinct(id_pessoa)) as pessoa ,  count(distinct(id_loja)) as loja 
FROM clientes*/


select *
from transformacoes

order by id_pessoa desc


