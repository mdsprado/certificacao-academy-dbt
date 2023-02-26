with 
    source_pessoas as (
        select
             
            cast(businessentityid as INTEGER) as id_pessoa
            , cast(persontype as STRING) as tipo_pessoa
            , cast(firstname as STRING) as primeiro_nome
            , cast(middlename as STRING) as nome_meio
            , cast(lastname as STRING) as ultimo_nome
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