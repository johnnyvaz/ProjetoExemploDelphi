unit untCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadProdutos = class(TForm)
    Panel1: TPanel;
    Label11: TLabel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    edtPesquisa: TEdit;
    btnPesquisar: TButton;
    DBNavigator1: TDBNavigator;
    dstProdutos: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmCadProdutos.btnCancelarClick(Sender: TObject);
begin
    DM.qryProdutos.Cancel;
    close;
end;

procedure TfrmCadProdutos.btnEditarClick(Sender: TObject);
begin
    btnGravar.Enabled := True;
    DM.qryProdutos.Edit;
end;

procedure TfrmCadProdutos.btnExcluirClick(Sender: TObject);
begin
        if MessageDlg('Tem certeza que deseja EXCLUIR ?', mtConfirmation, [mbYes, mbNo], 0, mbNo) =
         mrYes then
              DM.qryProdutos.Delete;

end;

procedure TfrmCadProdutos.btnGravarClick(Sender: TObject);
begin
    DM.qryProdutos.Post;
    btnGravar.Enabled := False;
end;

procedure TfrmCadProdutos.btnNovoClick(Sender: TObject);
begin
    btnGravar.Enabled := True;
    DM.qryProdutos.Insert;
end;

procedure TfrmCadProdutos.btnPesquisarClick(Sender: TObject);
const
    PesqVazia = 'SELECT * FROM PRODUTO';
var
    PesqPorCli : String;
begin

    PesqPorCli := 'SELECT * FROM CLIENTE WHERE NOME = ' + QuotedStr(edtPesquisa.Text);
        DM.qryProdutos.Active := False;

        if edtPesquisa.Text = '' then
          DM.qryProdutos.SQL.Text := PesqVazia
        else
          DM.qryProdutos.SQL.Text := PesqPorCli;

        DM.qryProdutos.Active := True;


end;

end.
