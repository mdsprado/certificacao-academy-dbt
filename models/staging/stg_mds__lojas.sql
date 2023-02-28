with 
    source_lojas as (
        select
            cast(businessentityid as INTEGER) as id_entidade
            , cast(name	as STRING) as nome_loja
            , cast(salespersonid	as INTEGER) as id_vendedor 
            --, demographics
            --, rowguid
            --, modifieddate
                            
        from {{ source ('mds','store')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_lojas 