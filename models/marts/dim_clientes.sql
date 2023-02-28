 with 
    clientes as (
        select 
            id_cliente 
            , cast((primeiro_nome_cliente || ' ' || ultimo_nome_cliente) as STRING) as nome_completo_cliente
            , empresa_cliente
            , endereco_cliente
            , cidade_cliente
            , estado_cliente
            , pais_cliente
            , cep_cliente
            , telefone_cliente
            , fax_cliente
            , email_cliente
        from {{ ref('stg_mds__clientes')}}
    )




, transformacoes as (
    select
        row_number() over (order by id_cliente) as pk_cliente
        , *
    from clientes
)

select *
from transformacoes