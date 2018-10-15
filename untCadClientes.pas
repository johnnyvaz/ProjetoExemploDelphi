unit untCadClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, frxClass,
  frxDBSet;

type
  TfrmCadClientes = class(TForm)
    Label1: TLabel;
    edtId: TDBEdit;
    dstClientes: TDataSource;
    Label2: TLabel;
    edtNome: TDBEdit;
    Label3: TLabel;
    edtLogradouro: TDBEdit;
    Label4: TLabel;
    edtNumero: TDBEdit;
    Label5: TLabel;
    edtBairro: TDBEdit;
    Label6: TLabel;
    edtCidade: TDBEdit;
    Label7: TLabel;
    edtEstado: TDBEdit;
    Label8: TLabel;
    edtCep: TDBEdit;
    Label9: TLabel;
    edtTelefone: TDBEdit;
    Label10: TLabel;
    edtCelular: TDBEdit;
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
    Label12: TLabel;
    edtEmail: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCepExit(Sender: TObject);
    procedure edtTelefoneExit(Sender: TObject);
    procedure edtCelularExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmCadClientes.btnCancelarClick(Sender: TObject);
begin
    DM.qryClientes.Cancel;
end;

procedure TfrmCadClientes.btnEditarClick(Sender: TObject);
begin
    btnGravar.Enabled := True;
    DM.qryClientes.Edit;
end;

procedure TfrmCadClientes.btnExcluirClick(Sender: TObject);
begin
        if MessageDlg('Tem certeza que deseja EXCLUIR ?', mtConfirmation, [mbYes, mbNo], 0, mbNo) =
         mrYes then
              DM.qryClientes.Delete;
end;

procedure TfrmCadClientes.btnGravarClick(Sender: TObject);
var vazio : String;
begin
vazio := edtId.Text;
vazio := vazio + edtNome.Text;
vazio := vazio + edtLogradouro.Text;
vazio := vazio + edtNumero.Text;
vazio := vazio + edtBairro.Text;
vazio := vazio + edtCidade.Text;
vazio := vazio + edtEstado.Text;
    if vazio <> ''
     then
       ShowMessage('Existem campos obrigatórios não preenchidos')
     else
       DM.qryClientes.Post;
       btnGravar.Enabled := False;
end;

procedure TfrmCadClientes.btnNovoClick(Sender: TObject);
var
    maxid : Integer;
begin
//    maxid := 'SELECT MAX(ID)+1 FROM CLIENTE' + QuotedStr(edtId.Text);
    btnGravar.Enabled := True;
    DM.qryClientes.Insert;
end;

procedure TfrmCadClientes.btnPesquisarClick(Sender: TObject);
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

procedure TfrmCadClientes.edtCelularExit(Sender: TObject);
begin
    //DBEdit10.Text := FormatFloat('#(00)00000-0000',StrtoFloat(DBEdit10.Text));
end;

//procedure TfrmCadClientes.DBEdit11Change(Sender: TObject);
//begin
//
//if Pos('@', String) <> 0
//then
//  ShowMessage('Email inválido')
//end;

procedure TfrmCadClientes.edtCepExit(Sender: TObject);
begin
    //DBEdit8.Text := FormatFloat('#00000-000',StrtoFloat(DBEdit8.Text));
end;


procedure TfrmCadClientes.edtTelefoneExit(Sender: TObject);
begin
    //DBEdit9.Text := FormatFloat('#(00)0000-0000',StrtoFloat(DBEdit9.Text));
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        DM.qryClientes.Active := False;
end;

procedure TfrmCadClientes.FormCreate(Sender: TObject);
begin
    DM.qryClientes.Active := True;
end;

end.
