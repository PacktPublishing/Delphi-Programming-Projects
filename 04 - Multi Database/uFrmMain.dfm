object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnShowUser: TButton
    Left = 24
    Top = 32
    Width = 75
    Height = 25
    Caption = 'User'
    TabOrder = 0
    OnClick = btnShowUserClick
  end
  object btnShowCustomer: TButton
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Customer'
    TabOrder = 1
    OnClick = btnShowCustomerClick
  end
  object btnShowProduct: TButton
    Left = 24
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Product'
    TabOrder = 2
    OnClick = btnShowProductClick
  end
end
