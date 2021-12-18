unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,UDM, Vcl.Grids, Vcl.DBGrids,UControleAbastecimento,
  Vcl.StdCtrls, Vcl.DBCtrls,inifiles,URelatorioMov, dxGDIPlusClasses,
  Vcl.ExtCtrls;

type
  TfmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Abastecimento1: TMenuItem;
    Relatrios1: TMenuItem;
    Image1: TImage;
    procedure Abastecimento1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Relatrios1Click(Sender: TObject);
  private
    { Private declarations }
    CheckDB : Boolean;
    PathDB  : String;
    procedure LoadIni;
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

{$R *.dfm}

procedure TfmPrincipal.Abastecimento1Click(Sender: TObject);
begin
   TfmControleAbastecimento.Create(Self)
end;

procedure TfmPrincipal.FormShow(Sender: TObject);
begin
   LoadIni;

   if not FileExists(PathDB)then
   begin
     MessageDlg('Configurar o Caminho do Banco de dados, no Conector.ini', mtError, [mbOK], 0);
     Application.Terminate;
   end
   else
   begin
    DataModule1.dbPosto.Params.Add('Database='+PathDB);
    DataModule1.dbPosto.open;
   end;

end;

procedure TfmPrincipal.LoadIni;
var p: string;
	ini: TIniFile;
begin
	p := ExtractFilePath( Application.ExeName);
    p :=  p + 'Conector.ini';
    ini := TIniFile.Create(p);
    try
    	PathDB  := ini.ReadString('SQLite','Database','')
    finally
    	ini.Free;
    end;
end;

procedure TfmPrincipal.Relatrios1Click(Sender: TObject);
begin
 TfmRel.Create(Self)
end;

end.
