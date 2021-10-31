object FmPrincipal: TFmPrincipal
  Left = 0
  Top = 0
  Caption = 'FmPrincipal'
  ClientHeight = 504
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblCpf: TLabel
    Left = 57
    Top = 17
    Width = 27
    Height = 16
    Caption = 'CPF:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNome: TLabel
    Left = 44
    Top = 45
    Width = 40
    Height = 16
    Caption = 'Nome:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblIdentidade: TLabel
    Left = 467
    Top = 45
    Width = 75
    Height = 16
    Caption = 'Identidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTelefone: TLabel
    Left = 24
    Top = 76
    Width = 60
    Height = 16
    Caption = 'Telefone:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblEmail: TLabel
    Left = 499
    Top = 76
    Width = 43
    Height = 16
    Caption = 'E-mail:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCep: TLabel
    Left = 56
    Top = 129
    Width = 28
    Height = 16
    Caption = 'CEP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblLogradouro: TLabel
    Left = 4
    Top = 165
    Width = 80
    Height = 16
    Caption = 'Logradouro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNumero: TLabel
    Left = 30
    Top = 196
    Width = 54
    Height = 16
    Caption = 'N'#250'mero:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblComplemento: TLabel
    Left = 450
    Top = 196
    Width = 92
    Height = 16
    Caption = 'Complemento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblBairro: TLabel
    Left = 40
    Top = 227
    Width = 44
    Height = 16
    Caption = 'Bairro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCidade: TLabel
    Left = 494
    Top = 227
    Width = 48
    Height = 16
    Caption = 'Cidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPais: TLabel
    Left = 53
    Top = 259
    Width = 31
    Height = 16
    Caption = 'Pa'#237's:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblEstado: TLabel
    Left = 493
    Top = 259
    Width = 49
    Height = 16
    Caption = 'Estado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblListaClientes: TLabel
    Left = 18
    Top = 338
    Width = 78
    Height = 13
    Caption = 'Lista de Clientes'
  end
  object lblFiltro: TLabel
    Left = 171
    Top = 338
    Width = 51
    Height = 13
    Caption = 'Filtrar por:'
  end
  object Button1: TButton
    Left = 678
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtCpf: TEdit
    Left = 92
    Top = 14
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtNome: TEdit
    Left = 92
    Top = 42
    Width = 348
    Height = 21
    TabOrder = 2
  end
  object edtIdentidade: TEdit
    Left = 547
    Top = 42
    Width = 178
    Height = 21
    TabOrder = 3
  end
  object edtTelefone: TEdit
    Left = 92
    Top = 73
    Width = 190
    Height = 21
    TabOrder = 4
  end
  object edtEmail: TEdit
    Left = 547
    Top = 73
    Width = 463
    Height = 21
    TabOrder = 5
  end
  object edtCep: TEdit
    Left = 92
    Top = 126
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object btnValidarCEP: TButton
    Left = 233
    Top = 125
    Width = 75
    Height = 25
    Caption = 'Validar CEP'
    TabOrder = 7
  end
  object edtLogradouro: TEdit
    Left = 92
    Top = 162
    Width = 348
    Height = 21
    TabOrder = 8
  end
  object edtNumero: TEdit
    Left = 92
    Top = 193
    Width = 190
    Height = 21
    TabOrder = 9
  end
  object edtComplemento: TEdit
    Left = 547
    Top = 193
    Width = 463
    Height = 21
    TabOrder = 10
  end
  object edtBairo: TEdit
    Left = 92
    Top = 224
    Width = 348
    Height = 21
    TabOrder = 11
  end
  object edtCidade: TEdit
    Left = 547
    Top = 224
    Width = 463
    Height = 21
    TabOrder = 12
  end
  object cmbPais: TComboBox
    Left = 92
    Top = 260
    Width = 346
    Height = 21
    TabOrder = 13
  end
  object cmbEstado: TComboBox
    Left = 547
    Top = 258
    Width = 346
    Height = 21
    TabOrder = 14
  end
  object cmbFiltro: TComboBox
    Left = 232
    Top = 335
    Width = 188
    Height = 21
    TabOrder = 15
  end
  object edtFiltro: TEdit
    Left = 441
    Top = 335
    Width = 350
    Height = 21
    TabOrder = 16
  end
  object btnFiltrar: TButton
    Left = 812
    Top = 333
    Width = 77
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 17
  end
  object btnLimparFiltro: TButton
    Left = 893
    Top = 333
    Width = 77
    Height = 25
    Caption = 'Limpar Filtro'
    TabOrder = 18
  end
  object btnNovo: TButton
    Left = 233
    Top = 11
    Width = 75
    Height = 25
    Caption = 'Novo Cliente'
    TabOrder = 19
  end
  object btnSalvar: TButton
    Left = 72
    Top = 301
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 20
  end
  object btnExcluir: TButton
    Left = 176
    Top = 301
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 21
  end
  object btnCancelar: TButton
    Left = 279
    Top = 301
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 22
  end
  object btnSair: TButton
    Left = 899
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 23
  end
  object sgrClientes: TStringGrid
    Left = 18
    Top = 362
    Width = 992
    Height = 120
    TabOrder = 24
    OnClick = sgrClientesClick
    OnDrawCell = sgrClientesDrawCell
  end
end
