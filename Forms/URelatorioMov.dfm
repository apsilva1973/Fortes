object fmRel: TfmRel
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Posto ABC - Movimenta'#231#227'o Diaria'
  ClientHeight = 615
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 56
    Top = 8
    Width = 794
    Height = 1123
    Borders.Style = bsClear
    DataSource = DataModule1.dsRelMov
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 59
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Color = clWhite
      ParentColor = False
      Transparent = False
      object RLSystemInfo1: TRLSystemInfo
        Left = 308
        Top = 0
        Width = 101
        Height = 16
        Align = faCenterTop
        Info = itTitle
        Text = 'Posto ABC'
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 235
        Top = 22
        Width = 240
        Height = 27
        Caption = 'Movimenta'#231#245'es Diaria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 591
        Top = 0
        Width = 127
        Height = 16
        Align = faRightTop
        Info = itPageNumber
        Text = 'P'#225'gina'
        Transparent = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 16
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = True
      Borders.DrawBottom = True
      GroupIndex = 1
      object RLDBText1: TRLDBText
        Left = 4
        Top = 0
        Width = 70
        Height = 16
        Align = faTopOnly
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'Tanque'
        DataSource = DataModule1.dsRelMov
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 76
        Top = 0
        Width = 70
        Height = 16
        Align = faTopOnly
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'Bomba'
        DataSource = DataModule1.dsRelMov
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 152
        Top = 0
        Width = 110
        Height = 16
        Align = faTopOnly
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'Valor_Abastecido'
        DataSource = DataModule1.dsRelMov
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 299
        Top = 0
        Width = 123
        Height = 16
        Align = faTopOnly
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'Qtde_Litros'
        DataSource = DataModule1.dsRelMov
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 428
        Top = 0
        Width = 109
        Height = 18
        Align = faTopOnly
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'Data_Venda'
        DataSource = DataModule1.dsRelMov
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 591
        Top = 0
        Width = 110
        Height = 16
        Align = faTopOnly
        AutoSize = False
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataField = 'Valor_Imposto'
        DataSource = DataModule1.dsRelMov
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 97
      Width = 718
      Height = 16
      BandType = btHeader
      Color = 8421631
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel2: TRLLabel
        Left = 0
        Top = 0
        Width = 50
        Height = 16
        Align = faTopOnly
        Caption = 'Tanque'
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 80
        Top = 0
        Width = 48
        Height = 16
        Align = faTopOnly
        Caption = 'Bomba'
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 152
        Top = 0
        Width = 150
        Height = 16
        Align = faTopOnly
        Caption = 'Valor Abastecido'
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 308
        Top = 0
        Width = 114
        Height = 16
        Align = faTopOnly
        Caption = 'Qtde_Litros'
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 591
        Top = 0
        Width = 106
        Height = 16
        Align = faTopOnly
        Caption = 'Valor Imposto'
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 428
        Top = 0
        Width = 109
        Height = 16
        Align = faTopOnly
        Caption = 'Data Venda'
        Transparent = False
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 16
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 648
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Text = 'Data:'
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 578
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Info = itHour
        Text = 'Hora:'
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 129
      Width = 718
      Height = 32
      BandType = btSummary
      object RLLabel8: TRLLabel
        Left = 3
        Top = 16
        Width = 91
        Height = 16
        Align = faBottomOnly
        Borders.Style = bsClear
        Caption = 'Total Geral...:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLDBText7: TRLDBText
        Left = 152
        Top = 16
        Width = 110
        Height = 16
        Align = faBottomOnly
        AutoSize = False
        Borders.Style = bsClear
        DataField = 'Valor_AbastecidoG'
        DataSource = DataModule1.dsTotal
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 299
        Top = 16
        Width = 110
        Height = 16
        Align = faBottomOnly
        AutoSize = False
        Borders.Style = bsClear
        DataField = 'Qtde_LitrosG'
        DataSource = DataModule1.dsTotal
        Text = ''
      end
      object RLDBText9: TRLDBText
        Left = 591
        Top = 16
        Width = 110
        Height = 16
        Align = faBottomOnly
        AutoSize = False
        Borders.Style = bsClear
        DataField = 'Valor_ImpostoG'
        DataSource = DataModule1.dsTotal
        Text = ''
      end
    end
  end
end
