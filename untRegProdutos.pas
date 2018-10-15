unit untRegProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,untCadClientes;

type
  TfrmRegProdutos = class(TForm)
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    Label11: TLabel;
    edtPesquisa: TEdit;
    btnPesquisar: TButton;
    dstProdutos: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegProdutos: TfrmRegProdutos;

implementation

{$R *.dfm}

uses untDM, untPrincipal, untCadProdutos;

procedure TfrmRegProdutos.btnCancelarClick(Sender: TObject);
begin
    DM.qryClientes.Cancel;
end;

procedure TfrmRegProdutos.btnEditarClick(Sender: TObject);
begin
    DBGrid1.SelectedIndex;
      try
        frmCadProdutos := TfrmCadProdutos.Create(Self);
        frmCadProdutos.ShowModal;
      finally
        frmCadProdutos.Free;
      end;

end;

procedure TfrmRegProdutos.btnExcluirClick(Sender: TObject);
begin
        if MessageDlg('Tem certeza que deseja EXCLUIR ?', mtConfirmation, [mbYes, mbNo], 0, mbNo) =
         mrYes then
              DM.qryClientes.Delete;
end;

procedure TfrmRegProdutos.btnGravarClick(Sender: TObject);
begin
    DM.qryClientes.Post;
    btnGravar.Enabled := False;
end;

procedure TfrmRegProdutos.btnNovoClick(Sender: TObject);
begin
      try
        frmCadProdutos := TfrmCadProdutos.Create(Self);
        frmCadProdutos.ShowModal;
      finally
        frmCadProdutos.Free;
      end;
end;

procedure TfrmRegProdutos.btnPesquisarClick(Sender: TObject);
const
    PesqVazia = 'SELECT * FROM CLIENTE';
var
    PesqPorCli : String;
begin

    PesqPorCli := 'SELECT * FROM CLIENTE WHERE NOME = ' + QuotedStr(edtPesquisa.Text);
        DM.qryClientes.Active := False;

        if edtPesquisa.Text = '' then
          DM.qryClientes.SQL.Text := PesqVazia
        else
          DM.qryClientes.SQL.Text := PesqPorCli;

        DM.qryClientes.Active := True;


end;

procedure TfrmRegProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        DM.qryClientes.Active := False;
end;

procedure TfrmRegProdutos.FormCreate(Sender: TObject);
begin
    DM.qryClientes.Active := True;
end;

end.
