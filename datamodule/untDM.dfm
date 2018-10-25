object DM: TDM
  OldCreateOrder = False
  Height = 346
  Width = 498
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=C:\ProgramaExemploDelphi\database\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object fdFbclient: TFDPhysFBDriverLink
    VendorLib = 'C:\ProgramaExemploDelphi\bin\fbclient.dll'
    Left = 112
    Top = 32
  end
  object qryClientes: TFDQuery
    Active = True
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 32
    Top = 104
    object qryClientesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryClientesLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 50
    end
    object qryClientesNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 50
    end
    object qryClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 50
    end
    object qryClientesESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 50
    end
    object qryClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 8
    end
    object qryClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 10
    end
    object qryClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 50
    end
    object qryClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
  end
  object qryProdutos: TFDQuery
    Active = True
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 112
    Top = 104
    object qryProdutosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object qryProdutosPRECO: TCurrencyField
      FieldName = 'PRECO'
      Origin = 'PRECO'
    end
  end
  object cdsAuxPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 248
  end
  object dsPedido: TDataSource
    DataSet = qryPedidos
    Left = 200
    Top = 104
  end
  object cdPedido: TClientDataSet
    Aggregates = <>
    MasterSource = dsPedido
    PacketRecords = 0
    Params = <>
    Left = 208
    Top = 248
  end
  object qryPedidos: TFDQuery
    Active = True
    IndexFieldNames = 'ID;IDCLIENTE'
    Connection = fdConexao
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM '
      'PEDIDO')
    Left = 200
    Top = 32
    object qryPedidosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPedidosIDCLIENTE: TSmallintField
      FieldName = 'IDCLIENTE'
      Origin = 'IDCLIENTE'
    end
    object qryPedidosCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 50
    end
    object qryPedidosEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object qryPedidosOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 50
    end
    object qryPedidosDESCONTO: TCurrencyField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object qryPedidosTOTAL: TCurrencyField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
    object qryPedidosTOTALLIQUIDO: TCurrencyField
      FieldName = 'TOTALLIQUIDO'
      Origin = 'TOTALLIQUIDO'
    end
  end
  object dsItemPedido: TDataSource
    DataSet = qryItemPedido
    Left = 272
    Top = 104
  end
  object cdItemPedido: TClientDataSet
    Aggregates = <>
    MasterSource = dsPedido
    PacketRecords = 0
    Params = <>
    Left = 296
    Top = 248
  end
  object qryItemPedido: TFDQuery
    Active = True
    IndexFieldNames = 'ID;IDPEDIDO'
    MasterSource = dsPedido
    MasterFields = 'ID;IDCLIENTE'
    Connection = fdConexao
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      'item'
      '')
    Left = 272
    Top = 32
    object qryItemPedidoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryItemPedidoIDPEDIDO: TIntegerField
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
      Required = True
    end
    object qryItemPedidoIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Origin = 'IDPRODUTO'
      Required = True
    end
    object qryItemPedidoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 50
    end
    object qryItemPedidoQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object qryItemPedidoVALORUNITARIO: TCurrencyField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
    end
    object qryItemPedidoTOTAL: TCurrencyField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
  end
end
