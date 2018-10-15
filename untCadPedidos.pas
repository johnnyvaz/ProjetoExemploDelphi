unit untCadPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TfrmCadPedidos = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    edtNome: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    DBNavigator2: TDBNavigator;
    Panel1: TPanel;
    btnItensPedido: TButton;
    DBGrid1: TDBGrid;
    DBEdit3: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnItensPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPedidos: TfrmCadPedidos;

implementation

{$R *.dfm}

uses untDM, untCadItemPedido;

procedure TfrmCadPedidos.btnCancelarClick(Sender: TObject);
begin
    DM.qryPedidos.Cancel;
    close;
end;

procedure TfrmCadPedidos.btnEditarClick(Sender: TObject);
begin
    btnGravar.Enabled := True;
    DM.qryPedidos.Active := True;
    DM.qryPedidos.Edit;
end;

procedure TfrmCadPedidos.btnExcluirClick(Sender: TObject);
begin
        if MessageDlg('Tem certeza que deseja EXCLUIR ?', mtConfirmation, [mbYes, mbNo], 0, mbNo) =
         mrYes then
         DM.qryPedidos.Delete;
end;

procedure TfrmCadPedidos.btnGravarClick(Sender: TObject);
begin
    DM.qryPedidos.Post;
    btnGravar.Enabled := False;
end;

procedure TfrmCadPedidos.btnItensPedidoClick(Sender: TObject);
begin
      try
        frmCadItemPedido := TfrmCadItemPedido.Create(Self);
        frmCadItemPedido.ShowModal;
      finally
        frmCadItemPedido.Free;
      end;
end;

procedure TfrmCadPedidos.btnNovoClick(Sender: TObject);
begin
    btnGravar.Enabled := True;
    DM.qryPedidos.Active := True;
    DM.qryPedidos.Append;
    DM.qryPedidos.FieldByName('EMISSAO').AsDateTime := now;
//    DM.qryPedidos.FieldByName('ID').AsInteger := DM.GerarCodPedido;

end;

procedure TfrmCadPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DM.qryPedidos.Active := False;
end;

procedure TfrmCadPedidos.FormCreate(Sender: TObject);
begin
    DM.qryPedidos.Active := True;
end;

end.
