with 
    source_person as (
        select
            	
            cast(businessentityid	as INTEGER) as id_pessoa
            , cast(persontype	as STRING) as tipo_pessoa
            , cast(firstname	as STRING) as primeiro_nome
            , cast(middlename	as STRING) as nome_meio
            , cast(lastname	as STRING) as ultimo_nome
            --, cast(namestyle	as BOOLEAN) as 
            --, cast(title	as STRING) as 
            --, cast(suffix	as STRING) as 
            --, cast(emailpromotion	as INTEGER) as 
            --, cast(additionalcontactinfo	as STRING) as 
            --, cast(demographics	as STRING) as 
            --, cast(rowguid	as STRING) as 
            --, cast(modifieddate	as STRING) as 
        from {{ source ('mds','person')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_person