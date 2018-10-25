unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, untCadPedidos, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.WinXCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Consultas1: TMenuItem;
    Relatrios1: TMenuItem;
    Sobre1: TMenuItem;
    ConsultarClientes1: TMenuItem;
    ConsultarProdutos1: TMenuItem;
    CadastrodePedido1: TMenuItem;
    ConsultaPedidos1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure ConsultarClientes1Click(Sender: TObject);
    procedure ConsultarProdutos1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure CadastrodePedido1Click(Sender: TObject);
    procedure PedidoVenda1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untClientes, untRegClientes,  untCadClientes, untCadProdutos,
  untRegProdutos, untDM, untPedidoVenda;



procedure TfrmPrincipal.CadastrodePedido1Click(Sender: TObject);
begin
      try
        frmCadPedidos := TfrmCadPedidos.Create(Self);
        frmCadPedidos.ShowModal;
      finally
        frmCadPedidos.Free;
      end;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
      try
        frmCadClientes := TfrmCadClientes.Create(Self);
        frmCadClientes.ShowModal;
      finally
        frmCadClientes.Free;
      end;
end;

procedure TfrmPrincipal.ConsultarClientes1Click(Sender: TObject);
begin
      try
        frmRegClientes := TfrmRegClientes.Create(Self);
        frmRegClientes.ShowModal;
      finally
        frmRegClientes.Free;

      end;
end;


procedure TfrmPrincipal.ConsultarProdutos1Click(Sender: TObject);
begin
      try
        frmRegProdutos := TfrmRegProdutos.Create(Self);
        frmRegProdutos.ShowModal;
      finally
        frmRegProdutos.Free;

      end;
end;

procedure TfrmPrincipal.PedidoVenda1Click(Sender: TObject);
begin
      try
        frmPedidoVenda := TfrmPedidoVenda.Create(Self);
        frmPedidoVenda.ShowModal;
      finally
        frmPedidoVenda.Free;
      end;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
      try
        frmCadProdutos := TfrmCadProdutos.Create(Self);
        frmCadProdutos.ShowModal;
      finally
        frmCadProdutos.Free;
      end;
end;

end.
