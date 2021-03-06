unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    dbPosto: TFDConnection;
    sqlAbastecimento: TFDQuery;
    dsAbastecimento: TDataSource;
    sqlAbastecimentoTanque: TStringField;
    sqlAbastecimentoBomba: TStringField;
    sqlAbastecimentoValor_Abastecido: TFloatField;
    sqlAbastecimentoQtde_Litros: TFloatField;
    sqlAbastecimentoData_Venda: TDateTimeField;
    sqlAbastecimentoValor_Imposto: TFloatField;
    sqlRelMov: TFDQuery;
    dsRelMov: TDataSource;
    sqlRelMovTanque: TStringField;
    sqlRelMovBomba: TStringField;
    sqlRelMovValor_Abastecido: TFloatField;
    sqlRelMovQtde_Litros: TFloatField;
    sqlRelMovData_Venda: TDateTimeField;
    sqlRelMovValor_Imposto: TFloatField;
    sqlTotal: TFDQuery;
    dsTotal: TDataSource;
    sqlTotalValor_AbastecidoG: TFloatField;
    sqlTotalQtde_LitrosG: TFloatField;
    sqlTotalValor_ImpostoG: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
