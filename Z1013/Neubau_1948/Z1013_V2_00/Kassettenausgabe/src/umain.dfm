object frmKCSave: TfrmKCSave
  Left = 214
  Top = 117
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Z1013-SAVE 0.4'
  ClientHeight = 290
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button3: TButton
    Left = 196
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Ende'
    TabOrder = 0
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 116
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Hilfe'
    TabOrder = 1
    OnClick = Button4Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 152
    Width = 264
    Height = 92
    Caption = ' Ausgabe als WAV '
    TabOrder = 2
    object Label4: TLabel
      Left = 144
      Top = 59
      Width = 53
      Height = 13
      Caption = 'Lautst'#228'rke:'
    end
    object Button2: TButton
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Ausgabe'
      Enabled = False
      TabOrder = 0
      OnClick = Button2Click
    end
    object edVolume: TEdit
      Left = 200
      Top = 56
      Width = 33
      Height = 21
      TabOrder = 1
      Text = '4'
      OnChange = UpDown1Exit
    end
    object UpDown1: TUpDown
      Left = 233
      Top = 56
      Width = 15
      Height = 21
      Associate = edVolume
      Max = 7
      Position = 4
      TabOrder = 2
    end
    object Checkbox1: TCheckBox
      Left = 16
      Top = 24
      Width = 228
      Height = 20
      Caption = 'Headersave-Header'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 265
    Height = 137
    Caption = ' Laden von Kassette '
    TabOrder = 3
    object Label6: TLabel
      Left = 16
      Top = 88
      Width = 30
      Height = 13
      Caption = 'AADR'
    end
    object Label7: TLabel
      Left = 80
      Top = 88
      Width = 30
      Height = 13
      Caption = 'EADR'
    end
    object Label8: TLabel
      Left = 144
      Top = 88
      Width = 30
      Height = 13
      Caption = 'SADR'
    end
    object Label11: TLabel
      Left = 16
      Top = 59
      Width = 54
      Height = 13
      Caption = 'Dateiname:'
    end
    object Label1: TLabel
      Left = 216
      Top = 88
      Width = 18
      Height = 13
      Caption = 'Typ'
    end
    object Button1: TButton
      Left = 16
      Top = 20
      Width = 75
      Height = 25
      Caption = #214'ffnen'
      TabOrder = 0
      OnClick = Button1Click
    end
    object AADR: TEdit
      Left = 16
      Top = 104
      Width = 55
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EADR: TEdit
      Left = 80
      Top = 104
      Width = 55
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object SADR: TEdit
      Left = 144
      Top = 104
      Width = 55
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edFilename: TEdit
      Left = 80
      Top = 56
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object TYP: TEdit
      Left = 216
      Top = 104
      Width = 31
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object Button5: TButton
      Left = 176
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Speichern'
      Enabled = False
      TabOrder = 6
      OnClick = Button5Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Z1013 mit Header (*.z80)|*.z80|Z1013 (*.z13)|*.z13'
    Left = 16
    Top = 248
  end
  object SaveDialog1: TSaveDialog
    Filter = 'WAV-Datei (*.wav)|*.wav'
    Left = 48
    Top = 248
  end
end
