 with 
    clientes as (
        select *
        from {{ ref('stg_mds__clientes')}}
    )

    , pessoas as (
        select *
        from {{ ref('stg_mds__pessoas')}}
    )

, juncao_tabelas as (
    select 
        clientes.id_cliente
        , clientes.id_pessoa
        , clientes.id_loja
        , clientes.id_territorio
        , pessoas.tipo_pessoa
        , pessoas.primeiro_nome
        , pessoas.nome_meio
        , pessoas.ultimo_nome
    from clientes
    left join pessoas on clientes.id_pessoa = pessoas.id_pessoa
    
)

, transformacoes as (
    select
        row_number() over (order by id_cliente) as pk_cliente
        , *
    from juncao_tabelas
)

select *
from transformacoes