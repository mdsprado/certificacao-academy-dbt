with 
    source_pessoas as (
        select
             
            cast(businessentityid as INTEGER) as id_entidade
            , cast(persontype as STRING) as tipo_pessoa
            , cast((firstname || ' ' || lastname) as STRING) as nome_completo
            --, middlename 
            --, namestyle
            --, title
            --, suffix
            --, emailpromotion
            --, additionalcontactinfo
            --, demographics
            --, rowguid
            --, modifieddate
        from {{ source ('mds','person')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_pessoas