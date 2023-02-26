 with 
    cartoes_credito as (
        select *
        from {{ ref('stg_mds__cartoes_credito')}}
    )

, transformacoes as (
    select
        row_number() over (order by id_cartao) as pk_cartao
        , *
    from cartoes_credito
)

select *
from transformacoes