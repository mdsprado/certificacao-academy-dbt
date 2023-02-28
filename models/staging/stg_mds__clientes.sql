with 
    source_clientes as (
        select
             
            cast(customerid as int) as id_cliente
            , cast(personid as int) as id_pessoa
            , cast(storeid as int) as id_loja
            , cast(territoryid as int) as id_territorio
            --, rowguid
            --, modifieddate
                            
        from {{ source ('mds','customer')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_clientes