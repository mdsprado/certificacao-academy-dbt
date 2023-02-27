with 
    source_pedidos as (
        select
            cast(salesorderid as INTEGER) as id_pedido
            , cast(customerid as INTEGER) as id_cliente
            , cast(salespersonid as INTEGER) as id_vendedor
            , cast(territoryid as INTEGER  ) as id_territorio
            , cast(billtoaddressid as INTEGER) as id_endereco_combranca
            , cast(shiptoaddressid as INTEGER) as id_endereco_envio
            , cast(shipmethodid as INTEGER) as id_metodo_envio
            , cast(creditcardid as INTEGER) as id_cartao
            , cast(orderdate as STRING) as data_pedido
            , cast(status as INTEGER) as status_pedido
            , cast(purchaseordernumber as STRING) as numero_ordem_compra
            , cast(accountnumber as STRING) as numero_conta
            , cast(creditcardapprovalcode as STRING) as codigo_aprovacao_cartao_credito
            , cast(subtotal as NUMERIC) as subtotal_pedido
            , cast(taxamt as NUMERIC) as imposto_pedido
            , cast(freight as NUMERIC) as frete_pedido
            , cast(totaldue as NUMERIC) as total_devido_pedido
            --, revisionnumber
            --, duedate
            --, shipdate
            --, onlineorderflag
            --, currencyrateid
            --, comment
            --, rowguid
            --, modifieddate
            
        from {{ source ('mds','salesorderheader')}} -- a macro source esta pegando no banco
    )

    -- tenho que seletar a tabela pois sem isso ela é so temporaria 

    select * from source_pedidos