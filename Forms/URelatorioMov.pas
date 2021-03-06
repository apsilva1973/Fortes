unit URelatorioMov;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UDM, RLReport;

type
  TfmRel = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand4: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLBand5: TRLBand;
    RLDBText7: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRel: TfmRel;

implementation

{$R *.dfm}

procedure TfmRel.FormShow(Sender: TObject);
begin
  DataModule1.sqlRelMov.Active := False;
  DataModule1.sqlRelMov.Active := True;

  DataModule1.sqlTotal.Active := False;
  DataModule1.sqlTotal.Active := True;
  RLReport1.Preview();
  Self.Close;
end;

end.
