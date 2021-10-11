object Form1: TForm1
  Left = 220
  Top = 131
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Forex info'
  ClientHeight = 298
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object label1: TLabel
    Left = 8
    Top = 0
    Width = 159
    Height = 17
    Caption = #1055#1088#1086#1074#1077#1082#1072' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object clickpanel: TPageControl
    Left = 0
    Top = 22
    Width = 316
    Height = 276
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '          '#1050#1086#1090#1080#1088#1086#1074#1082#1080'          '
      object GroupBox1: TGroupBox
        Left = 6
        Top = 10
        Width = 294
        Height = 228
        Caption = '  '#1055#1072#1088#1099' '#1074#1072#1083#1102#1090'                         Bid              Ask   '
        TabOrder = 0
        object val7: TLabel
          Left = 12
          Top = 199
          Width = 69
          Height = 16
          Caption = 'Loading...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object val6: TLabel
          Left = 12
          Top = 170
          Width = 69
          Height = 16
          Caption = 'Loading...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object val5: TLabel
          Left = 12
          Top = 140
          Width = 69
          Height = 16
          Caption = 'Loading...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object val4: TLabel
          Left = 12
          Top = 111
          Width = 69
          Height = 16
          Caption = 'Loading...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object val3: TLabel
          Left = 12
          Top = 81
          Width = 69
          Height = 16
          Caption = 'Loading...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object val2: TLabel
          Left = 12
          Top = 52
          Width = 69
          Height = 16
          Caption = 'Loading...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object val1: TLabel
          Left = 12
          Top = 22
          Width = 69
          Height = 16
          Caption = 'Loading...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object kot1: TLabel
          Left = 162
          Top = 22
          Width = 3
          Height = 16
        end
        object kot2: TLabel
          Left = 162
          Top = 49
          Width = 3
          Height = 16
        end
        object kot3: TLabel
          Left = 162
          Top = 79
          Width = 3
          Height = 16
        end
        object kot4: TLabel
          Left = 162
          Top = 108
          Width = 3
          Height = 16
        end
        object kot5: TLabel
          Left = 162
          Top = 138
          Width = 3
          Height = 16
        end
        object kot6: TLabel
          Left = 162
          Top = 167
          Width = 3
          Height = 16
        end
        object kot7: TLabel
          Left = 162
          Top = 197
          Width = 3
          Height = 16
        end
        object Image1: TImage
          Left = 118
          Top = 22
          Width = 11
          Height = 15
        end
        object Image2: TImage
          Left = 118
          Top = 49
          Width = 11
          Height = 15
        end
        object Image3: TImage
          Left = 118
          Top = 79
          Width = 11
          Height = 15
        end
        object Image4: TImage
          Left = 118
          Top = 108
          Width = 11
          Height = 15
        end
        object Image5: TImage
          Left = 118
          Top = 138
          Width = 11
          Height = 15
        end
        object Image6: TImage
          Left = 118
          Top = 167
          Width = 11
          Height = 15
        end
        object Image7: TImage
          Left = 118
          Top = 197
          Width = 11
          Height = 15
        end
      end
    end
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 264
    Top = 248
  end
end
