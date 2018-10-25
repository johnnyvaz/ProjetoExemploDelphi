unit untCadItemPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadItemPedido = class(TForm)
    Panel1: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    DBNavigator2: TDBNavigator;
    dsItemPedido: TDataSource;
    Label1: TLabel;
    edtIdItem: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadItemPedido: TfrmCadItemPedido;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmCadItemPedido.btnCancelarClick(Sender: TObject);
begin
close;
end;

procedure TfrmCadItemPedido.btnExcluirClick(Sender: TObject);
begin
        if MessageDlg('Tem certeza que deseja EXCLUIR ?', mtConfirmation, [mbYes, mbNo], 0, mbNo) =
         mrYes then
         DM.qryItemPedido.Delete;
end;

procedure TfrmCadItemPedido.btnNovoClick(Sender: TObject);
var idItem : integer ;
begin
    btnGravar.Enabled := True;
    DM.qryItemPedido.Active := True;
    idItem := DM.qryItemPedido.SQL.Add('SELECT GEN_ID(GEN_ITEM_ID,1) FROM RDB$DATABASE');
    DM.qryItemPedido.Append;
    edtIdItem.Text :=  idItem.ToString ;

end;

//function TDM.GenID(tablename: String): Integer;
//var
//  Qry: TSQLQuery;
//begin
//  Qry := TSQLQuery.Create(Self);
//  Qry.SQLConnection := DBAcesso;
//  Qry.SQL.Add('SELECT GEN_ID(GEN_'+tablename+'_ID,1) FROM RDB$DATABASE');
//  Qry.Open;
//  Result := Qry.Fields[0].AsInteger;
//end;


end.
