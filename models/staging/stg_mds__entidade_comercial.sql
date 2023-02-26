with 
    source_entidade_comercial as (
        select
            cast(businessentityid as INTEGER) as id_entidade
            , cast(personid as INTEGER) as id_pessoa
            --, contacttypeid
            --, rowguid
            --, modifieddate
        from {{ source ('mds','businessentitycontact')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_entidade_comercial