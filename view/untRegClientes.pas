unit untRegClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,untCadClientes;

type
  TfrmRegClientes = class(TForm)
    dstClientes: TDataSource;
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
  frmRegClientes: TfrmRegClientes;

implementation

{$R *.dfm}

uses untDM, untPrincipal;

procedure TfrmRegClientes.btnCancelarClick(Sender: TObject);
begin
    DM.qryClientes.Cancel;
end;

procedure TfrmRegClientes.btnEditarClick(Sender: TObject);
begin
    DBGrid1.SelectedIndex;
      try
        frmCadClientes := TfrmCadClientes.Create(Self);
        frmCadClientes.ShowModal;
      finally
        frmCadClientes.Free;
      end;

end;

procedure TfrmRegClientes.btnExcluirClick(Sender: TObject);
begin
        if MessageDlg('Tem certeza que deseja EXCLUIR ?', mtConfirmation, [mbYes, mbNo], 0, mbNo) =
         mrYes then
              DM.qryClientes.Delete;
end;

procedure TfrmRegClientes.btnGravarClick(Sender: TObject);
begin
    DM.qryClientes.Post;
    btnGravar.Enabled := False;
end;

procedure TfrmRegClientes.btnNovoClick(Sender: TObject);
begin
      try
        frmCadClientes := TfrmCadClientes.Create(Self);
        frmCadClientes.ShowModal;
      finally
        frmCadClientes.Free;
      end;
end;

procedure TfrmRegClientes.btnPesquisarClick(Sender: TObject);
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

procedure TfrmRegClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        DM.qryClientes.Active := False;
end;

procedure TfrmRegClientes.FormCreate(Sender: TObject);
begin
    DM.qryClientes.Active := True;
end;

end.
