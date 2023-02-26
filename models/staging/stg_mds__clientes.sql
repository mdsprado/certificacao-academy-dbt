with 
    source_clientes as (
        select
             
            cast(customerid AS INTEGER) as id_cliente
            , cast(personid as INTEGER) as id_pessoa
            , cast(storeid as INTEGER) as id_loja
            , cast(territoryid as INTEGER) as id_territorio
            --, rowguid
            --, modifieddate
                            
        from {{ source ('mds','customer')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_clientes