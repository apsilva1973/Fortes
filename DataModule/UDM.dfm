object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 260
  Width = 354
  object dbPosto: TFDConnection
    ConnectionName = 'Posto'
    Params.Strings = (
      'DriverID=SQLite'
      'LockingMode=Normal'
      'Synchronous=Normal'
      '')
    FetchOptions.AssignedValues = [evItems, evCache, evCursorKind, evAutoFetchAll]
    FetchOptions.CursorKind = ckStatic
    FetchOptions.AutoFetchAll = afTruncate
    FetchOptions.Items = [fiBlobs]
    FetchOptions.Cache = [fiBlobs]
    FormatOptions.AssignedValues = [fvMapRules, fvStrsTrim]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtDateTimeStamp
        TargetDataType = dtDateTime
      end
      item
        PrecMax = 10
        PrecMin = 0
        ScaleMax = 0
        ScaleMin = 0
        SourceDataType = dtFmtBCD
        TargetDataType = dtInt32
      end
      item
        ScaleMax = 9
        ScaleMin = 0
        SourceDataType = dtFmtBCD
        TargetDataType = dtDouble
      end
      item
        SourceDataType = dtBCD
        TargetDataType = dtDouble
      end
      item
        SourceDataType = dtExtended
        TargetDataType = dtDouble
      end
      item
        SourceDataType = dtSingle
        TargetDataType = dtDouble
      end
      item
        SourceDataType = dtInt64
        TargetDataType = dtDouble
      end
      item
        SourceDataType = dtWideString
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end>
    ResourceOptions.AssignedValues = [rvDirectExecute, rvAutoReconnect, rvKeepConnection]
    ResourceOptions.AutoReconnect = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    Left = 64
    Top = 26
  end
  object sqlAbastecimento: TFDQuery
    Connection = dbPosto
    SQL.Strings = (
      ''
      'SELECT '
      '  T.DESCRICAO AS Tanque,'
      '  B.DESCRICAO AS Bomba,'
      '  A.VALOR_ABASTECIDO AS Valor_Abastecido,'
      '  A.QTDE_LITROS AS Qtde_Litros,'
      '  A.DATA_VENDA AS Data_Venda,'
      '  A.Valor_IMPOSTO AS Valor_Imposto'
      ' FROM ABASTECIMENTOS A'
      'INNER JOIN TANQUES T ON T.IDTANQUE = A.IDTANQUE'
      'INNER JOIN BOMBAS  B ON B.IDBOMBA  = A.IDBOMBA'
      'INNER JOIN COMBUSTIVEL C ON C.IDCOMBUSTIVEL = T.IDCOMBUSTIVEL'
      
        'INNER JOIN PRECO_COMBUSTIVEL P ON P.IDCOMBUSTIVEL = C.IDCOMBUSTI' +
        'VEL')
    Left = 152
    Top = 24
    object sqlAbastecimentoTanque: TStringField
      DisplayWidth = 15
      FieldName = 'Tanque'
      Origin = 'Tanque'
      Required = True
      Size = 100
    end
    object sqlAbastecimentoBomba: TStringField
      DisplayWidth = 15
      FieldName = 'Bomba'
      Origin = 'Bomba'
      Required = True
      Size = 100
    end
    object sqlAbastecimentoValor_Abastecido: TFloatField
      FieldName = 'Valor_Abastecido'
      Origin = 'Valor_Abastecido'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
    end
    object sqlAbastecimentoQtde_Litros: TFloatField
      FieldName = 'Qtde_Litros'
      Origin = 'Qtde_Litros'
      Required = True
    end
    object sqlAbastecimentoData_Venda: TDateTimeField
      DisplayWidth = 12
      FieldName = 'Data_Venda'
      Origin = 'Data_Venda'
      Required = True
    end
    object sqlAbastecimentoValor_Imposto: TFloatField
      FieldName = 'Valor_Imposto'
      Origin = 'Valor_Imposto'
      Required = True
      DisplayFormat = 'R$ #,##0.00'
    end
  end
  object dsAbastecimento: TDataSource
    DataSet = sqlAbastecimento
    Left = 256
    Top = 24
  end
  object sqlRelMov: TFDQuery
    Connection = dbPosto
    SQL.Strings = (
      'SELECT '
      '  T.DESCRICAO AS Tanque,'
      '  B.DESCRICAO AS Bomba,'
      '  SUM(A.VALOR_ABASTECIDO) AS Valor_Abastecido,'
      '  SUM(A.QTDE_LITROS) AS Qtde_Litros,'
      '  A.DATA_VENDA AS Data_Venda,'
      '  SUM(A.Valor_IMPOSTO) AS Valor_Imposto'
      ' FROM ABASTECIMENTOS A'
      'INNER JOIN TANQUES T ON T.IDTANQUE = A.IDTANQUE'
      'INNER JOIN BOMBAS  B ON B.IDBOMBA  = A.IDBOMBA'
      'INNER JOIN COMBUSTIVEL C ON C.IDCOMBUSTIVEL = T.IDCOMBUSTIVEL'
      
        'INNER JOIN PRECO_COMBUSTIVEL P ON P.IDCOMBUSTIVEL = C.IDCOMBUSTI' +
        'VEL'
      'GROUP BY A.DATA_VENDA, T.DESCRICAO, B.DESCRICAO ')
    Left = 152
    Top = 88
    object sqlRelMovTanque: TStringField
      FieldName = 'Tanque'
      Origin = 'Tanque'
      Required = True
      Size = 100
    end
    object sqlRelMovBomba: TStringField
      FieldName = 'Bomba'
      Origin = 'Bomba'
      Required = True
      Size = 100
    end
    object sqlRelMovValor_Abastecido: TFloatField
      FieldName = 'Valor_Abastecido'
      Origin = 'Valor_Abastecido'
      DisplayFormat = 'R$ #,##0.00'
    end
    object sqlRelMovQtde_Litros: TFloatField
      FieldName = 'Qtde_Litros'
      Origin = 'Qtde_Litros'
    end
    object sqlRelMovData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
      Origin = 'Data_Venda'
      Required = True
    end
    object sqlRelMovValor_Imposto: TFloatField
      FieldName = 'Valor_Imposto'
      Origin = 'Valor_Imposto'
      DisplayFormat = 'R$ #,##0.00'
    end
  end
  object dsRelMov: TDataSource
    DataSet = sqlRelMov
    Left = 256
    Top = 88
  end
  object sqlTotal: TFDQuery
    Connection = dbPosto
    SQL.Strings = (
      'SELECT '
      '  SUM(A.VALOR_ABASTECIDO) AS Valor_AbastecidoG,'
      '  SUM(A.QTDE_LITROS) AS Qtde_LitrosG,'
      '  SUM(A.Valor_IMPOSTO) AS Valor_ImpostoG'
      ' FROM ABASTECIMENTOS A'
      'INNER JOIN TANQUES T ON T.IDTANQUE = A.IDTANQUE'
      'INNER JOIN BOMBAS  B ON B.IDBOMBA  = A.IDBOMBA'
      'INNER JOIN COMBUSTIVEL C ON C.IDCOMBUSTIVEL = T.IDCOMBUSTIVEL'
      
        'INNER JOIN PRECO_COMBUSTIVEL P ON P.IDCOMBUSTIVEL = C.IDCOMBUSTI' +
        'VEL')
    Left = 152
    Top = 152
    object sqlTotalValor_AbastecidoG: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Valor_AbastecidoG'
      Origin = 'Valor_AbastecidoG'
      ProviderFlags = []
      DisplayFormat = 'R$ #,##0.00'
    end
    object sqlTotalQtde_LitrosG: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Qtde_LitrosG'
      Origin = 'Qtde_LitrosG'
      ProviderFlags = []
    end
    object sqlTotalValor_ImpostoG: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Valor_ImpostoG'
      Origin = 'Valor_ImpostoG'
      ProviderFlags = []
      DisplayFormat = 'R$ #,##0.00'
    end
  end
  object dsTotal: TDataSource
    DataSet = sqlTotal
    Left = 256
    Top = 152
  end
end
