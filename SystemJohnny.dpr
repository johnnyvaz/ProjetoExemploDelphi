program SystemJohnny;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untRegProdutos in 'untRegProdutos.pas' {frmRegProdutos},
  untDM in 'untDM.pas' {DM: TDataModule},
  untCadProdutos in 'untCadProdutos.pas' {frmCadProdutos},
  untCadPedidos in 'untCadPedidos.pas' {frmCadPedidos},
  untCadClientes in 'untCadClientes.pas' {frmCadClientes},
  untCadItemPedido in 'untCadItemPedido.pas' {frmCadItemPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadClientes, frmCadClientes);
  Application.CreateForm(TfrmCadItemPedido, frmCadItemPedido);
  Application.Run;
end.
