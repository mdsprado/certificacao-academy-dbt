 with 
    clientes as (
        select *
        from {{ ref('stg_mds__clientes')}}
    )

    , entidade as (
        select *
        from {{ ref('stg_mds__entidade_comercial')}}
    )
    , pessoas as (
        select *
        from {{ ref('stg_mds__pessoas')}}
    )

, juncao_tabelas1 as (
    select 
        clientes.id_cliente
        , clientes.id_pessoa
        , clientes.id_loja
        , clientes.id_territorio
        , entidade.id_entidade
        
    from clientes
    left join entidade on clientes.id_pessoa = entidade.id_pessoa
    
)
, juncao_tabelas2 as (
    select 
        juncao_tabelas1.id_cliente
        , juncao_tabelas1.id_pessoa
        , juncao_tabelas1.id_loja
        , juncao_tabelas1.id_territorio
        , pessoas.id_entidade
        , pessoas.tipo_pessoa
        , pessoas.nome_completo
    from juncao_tabelas1
    left join pessoas on juncao_tabelas1.id_entidade = pessoas.id_entidade
)



, transformacoes as (
    select
        row_number() over (order by id_cliente) as pk_cliente
        , *
    from juncao_tabelas2
)

select *
from transformacoes