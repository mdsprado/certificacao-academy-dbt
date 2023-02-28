with 
    source_clientes as (
        select
             
            cast(CustomerId as int) as id_cliente 
            , cast(FirstName as string) as primeiro_nome_cliente
            , cast(LastName as string)  as ultimo_nome_cliente
            , cast(Company as string)  as empresa_cliente
            , cast(Address as string) as endereco_cliente
            , cast(City as string) as cidade_cliente
            , cast(State as string) as estado_cliente
            , cast(Country as string) as pais_cliente
            , cast(PostalCode as string) as cep_cliente
            , cast(Phone as string) as telefone_cliente
            , cast(Fax as string) as fax_cliente
            , cast(Email as string) as email_cliente
            --, SupportRepId
                            
        from {{ source ('mds','customer')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_clientes