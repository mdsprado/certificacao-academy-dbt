with 
    source_cartoes_credito as (
        select
            cast(creditcardid as INTEGER) as id_cartao
            , cast(cardtype as STRING) as tipo_cartao
            , cast(cardnumber as INTEGER) as numero_cartao
            --, expmonth
            --, expyear
            --, modifieddate
                            
        from {{ source ('mds','creditcard')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_cartoes_credito