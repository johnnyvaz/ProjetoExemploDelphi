object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema Johnny Vaz'
  ClientHeight = 442
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 16
    Top = 16
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object ConsultarClientes1: TMenuItem
        Caption = 'Consultar Clientes'
        OnClick = ConsultarClientes1Click
      end
      object ConsultarProdutos1: TMenuItem
        Caption = 'Consultar Produtos'
        OnClick = ConsultarProdutos1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Pedidos'
      object CadastrodePedido1: TMenuItem
        Caption = 'Cadastro de Pedido'
        OnClick = CadastrodePedido1Click
      end
    end
    object Sobre1: TMenuItem
      Caption = 'Help'
    end
  end
end
