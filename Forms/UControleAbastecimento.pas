unit UControleAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.ComCtrls,UDM,FireDAC.Phys.Intf, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,FireDAC.VCLUI.Wait, Vcl.Mask,  Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TfmControleAbastecimento = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    lblCombustivel: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    lblData: TLabel;
    ButAdicionarTitulo: TBitBtn;
    Label5: TLabel;
    Edit2: TEdit;
    mskLitros: TEdit;
    TabSheet2: TTabSheet;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2Select(Sender: TObject);
    procedure ButAdicionarTituloClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    Valor_Combustivel,ValorPago, Valor_Imposto : Currency;
    qryAux: TFDQuery;
    Procedure GetTanques;
    Procedure GetCombustivel;
    Procedure GetConfiguracao;
    Procedure GetSetFocus(Obj: TObject);
    Procedure GetHistoricoAbastecimento;
    Procedure PopulaAbastecimento;
    procedure LimpaEdits;
    Function CalculaLitragem( ValorAbastecido : Real; Preco_Litro : Real ) : Real;
    Function CalculaImposto( ValorAbastecido : Real; Percetual : Real ) : Real;


  public
    { Public declarations }
  end;

var
  fmControleAbastecimento: TfmControleAbastecimento;

implementation

{$R *.dfm}

procedure TfmControleAbastecimento.ButAdicionarTituloClick(Sender: TObject);
begin

 if (ValorPago = 0) and
    (Valor_Imposto = 0) then
 begin
    MessageDlg('Valor do abastecimento esta zerado!', mtError, [mbOK], 0);
    GetSetFocus(Edit1);
    Exit;
 end;
 PopulaAbastecimento;
 LimpaEdits;
 GetSetFocus(Edit1);

end;

function TfmControleAbastecimento.CalculaImposto(ValorAbastecido: Real;
  Percetual: Real): Real;
begin
  result :=  strtofloat( StringReplace(formatfloat('#,0.00', (ValorAbastecido * Percetual)), '.', '', [])) ;
end;

function TfmControleAbastecimento.CalculaLitragem(ValorAbastecido,
  Preco_Litro: Real): Real;
begin
  result :=  strtofloat(formatfloat('#0.0000', (ValorAbastecido / Preco_Litro))) ;
end;

procedure TfmControleAbastecimento.ComboBox1Select(Sender: TObject);
begin
 GetCombustivel;
 LimpaEdits;
 GetSetFocus(Edit1);
end;

procedure TfmControleAbastecimento.ComboBox2Select(Sender: TObject);
begin
 LimpaEdits;
 GetSetFocus(Edit1);
end;

procedure TfmControleAbastecimento.Edit1Click(Sender: TObject);
begin
 //Formatar(Edit1,TFormato.Valor);
end;

procedure TfmControleAbastecimento.Edit1Exit(Sender: TObject);
begin
 GetConfiguracao;
end;

procedure TfmControleAbastecimento.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin

 If key = #13 then
   Begin
      Key:= #0;
      Perform(Wm_NextDlgCtl,0,0);
   end;

// Permitir somente n?meros, ponto e v?rgula.
if not (key in ['0'..'9',',',#8]) then
  key :=#0;



end;

procedure TfmControleAbastecimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
     Perform(WM_nextdlgctl,0,0)
 else if Key =  #27 then
     Perform(WM_nextdlgctl,1,0)
end;

procedure TfmControleAbastecimento.FormShow(Sender: TObject);
begin
  Height := 543;
  Width  := 1000;
  GetTanques;
  GetCombustivel;
  lblData.Caption := 'Data ' + DateToStr(now);
  GetSetFocus(Edit1);
end;

procedure TfmControleAbastecimento.LimpaEdits;
var
  i: integer;
begin
for i := 0 to TabSheet1.ControlCount - 1 do
    if (TabSheet1.Controls[i] is TEdit) then
      (TabSheet1.Controls[i] as TEdit).Text := '';
end;

procedure TfmControleAbastecimento.PageControl1Change(Sender: TObject);
begin
 if PageControl1.ActivePage = TabSheet2 then
  begin
    DataModule1.sqlAbastecimento.Active := False;
    DataModule1.sqlAbastecimento.Active := True;
  end;

end;

procedure TfmControleAbastecimento.PopulaAbastecimento;

begin
  qryAux:= TFDQuery.Create(nil);
  try
    with qryAux do
    begin
      ConnectionName := DataModule1.dbPosto.ConnectionName;
      with sql do
      begin
        clear;

        add('INSERT INTO ABASTECIMENTOS (IdTanque,IdBomba,Qtde_Litros,Valor_Abastecido,Data_Venda,Valor_Imposto)');
        add('VALUES(:IdTanque,:IdBomba,:Qtde_Litros,:Valor_Abastecido,:Data_Venda,:Valor_Imposto ) ');

        ParamByName('IdTanque').AsInteger           :=  ComboBox1.ItemIndex+1;
        ParamByName('IdBomba').AsInteger            :=  ComboBox2.ItemIndex+1;
        ParamByName('Qtde_Litros').AsFloat          :=  StrtoFloat( mskLitros.Text);
        ParamByName('Valor_Abastecido').AsFloat     :=  ValorPago;
        ParamByName('Data_Venda').AsDate            :=  Now;
        ParamByName('Valor_Imposto').AsFloat        :=  Valor_Imposto;

        ExecSQL;

      end;
    end;
  finally
    qryAux.free;
    MessageDlg('Opera??o concluido com Sucesso.' + #13#10 , mtConfirmation, [mbOk], 0);
  end;
end;

procedure TfmControleAbastecimento.GetTanques;

begin
  qryAux:= TFDQuery.Create(nil);
  ComboBox1.Items.Clear;
  try
    with qryAux do
    begin
      ConnectionName := DataModule1.dbPosto.ConnectionName;
      with sql do
      begin
        clear;
        add('Select * from Tanques');
        open;

        First;
        while not qryAux.eof do
        begin
         ComboBox1.items.add(qryAux.fieldbyname('Descricao').asstring);
         qryAux.next
        end;
        ComboBox1.ItemIndex := 0;
      end;
    end;
  finally
    qryAux.free;
  end;

end;

procedure TfmControleAbastecimento.GetCombustivel;

begin
  qryAux:= TFDQuery.Create(nil);
  try
    with qryAux do
    begin
      ConnectionName := DataModule1.dbPosto.ConnectionName;
      with sql do
      begin
        clear;
        add('SELECT T.Descricao as Tanques, C.Descricao as Combustivel, P.VALOR AS Valor_Combustivel FROM TANQUES T');
        add('INNER JOIN COMBUSTIVEL C ON C.IDCOMBUSTIVEL = T.IDCOMBUSTIVEL');
        add('INNER JOIN PRECO_COMBUSTIVEL P ON P.IDCOMBUSTIVEL = C.IDCOMBUSTIVEL');

        add('WHERE T.IDTANQUE = :IDTANQUE');

        ParamByName('IDTANQUE').AsInteger :=  ComboBox1.ItemIndex+1;

        open;

        lblCombustivel.Caption :=   fieldbyname('Combustivel').asstring + ' - R$ ' + FloatToStr(fieldbyname('Valor_Combustivel').AsVariant);
        Valor_Combustivel := fieldbyname('Valor_Combustivel').AsVariant;
      end;
    end;
  finally
    qryAux.free;
  end;

end;

procedure TfmControleAbastecimento.GetConfiguracao;
begin
Edit1.Text := FormatFloat( '#,0.00', StrToFloat(Edit1.Text));
 ValorPago := StrToFloat( StringReplace(Edit1.Text, '.', '', [])   );
 mskLitros.Text := FloatToStr( CalculaLitragem(ValorPago,Valor_Combustivel));
 Edit2.Text :=  FloatToStr( CalculaImposto(ValorPago,0.13));
 Valor_Imposto := StrToFloat(Edit2.Text);

 Edit2.Text := FormatFloat( '#,0.00', StrToFloat(Edit2.Text));
end;

procedure TfmControleAbastecimento.GetHistoricoAbastecimento;
begin
end;

procedure TfmControleAbastecimento.GetSetFocus(Obj: TObject);
begin
      if obj is TEdit then
      Begin
           TEdit(obj).Text := FormatFloat( '#,##0.00', StrToFloat('0,00'));
           TEdit(obj).SetFocus;
      End;

end;

end.
