 with 
    produtos as (
        select *
        from {{ ref('stg_mds__produtos')}}
    )

, transformacoes as (
    select
        row_number() over (order by id_produto) as pk_produto
        , *
    from produtos
)

select *
from transformacoes