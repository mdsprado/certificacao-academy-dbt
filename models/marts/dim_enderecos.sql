 with 
    enderecos as (
        select *
        from {{ ref('stg_mds__enderecos')}}
    )

, with 
    provincias as (
        select *
        from {{ ref('stg_mds__estado_provincias')}}
    )

,with 
    paises as (
        select *
        from {{ ref('stg_mds__regioes_paises')}}
    )

,transformacoes as (
    select
        row_number() over (order by id_produto) as pk_produto
        , *
    from produtos
)

select *
from transformacoes