unit untDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, Datasnap.DBClient;

type
  TDM = class(TDataModule)
    fdConexao: TFDConnection;
    fdFbclient: TFDPhysFBDriverLink;
    qryClientes: TFDQuery;
    qryProdutos: TFDQuery;
    qryProdutosID: TIntegerField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosPRECO: TCurrencyField;
    cdsAuxPedido: TClientDataSet;
    dsPedido: TDataSource;
    cdPedido: TClientDataSet;
    qryPedidos: TFDQuery;
    qryPedidosID: TIntegerField;
    qryPedidosIDCLIENTE: TSmallintField;
    qryPedidosCLIENTE: TStringField;
    qryPedidosEMISSAO: TDateField;
    qryPedidosOBSERVACAO: TStringField;
    qryPedidosDESCONTO: TCurrencyField;
    qryPedidosTOTAL: TCurrencyField;
    qryPedidosTOTALLIQUIDO: TCurrencyField;
    dsItemPedido: TDataSource;
    cdItemPedido: TClientDataSet;
    qryItemPedido: TFDQuery;
    qryItemPedidoID: TIntegerField;
    qryItemPedidoIDPEDIDO: TIntegerField;
    qryItemPedidoIDPRODUTO: TIntegerField;
    qryItemPedidoPRODUTO: TStringField;
    qryItemPedidoQUANTIDADE: TIntegerField;
    qryItemPedidoVALORUNITARIO: TCurrencyField;
    qryItemPedidoTOTAL: TCurrencyField;
    qryClientesID: TIntegerField;
    qryClientesNOME: TStringField;
    qryClientesLOGRADOURO: TStringField;
    qryClientesNUMERO: TIntegerField;
    qryClientesBAIRRO: TStringField;
    qryClientesCIDADE: TStringField;
    qryClientesESTADO: TStringField;
    qryClientesCEP: TStringField;
    qryClientesTELEFONE: TStringField;
    qryClientesCELULAR: TStringField;
    qryClientesEMAIL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarCodPedido: integer;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDM.GerarCodPedido: integer;
begin
    DM.qryPedidos.Active := True;
    Result := DM.qryPedidos.FieldByName('ID').AsInteger +1 ;
    DM.qryPedidos.Active := False;
end;

end.
