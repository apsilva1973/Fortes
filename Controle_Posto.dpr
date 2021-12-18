program Controle_Posto;

uses
  Vcl.Forms,
  uPrincipal in 'Forms\uPrincipal.pas' {fmPrincipal},
  UDM in 'DataModule\UDM.pas' {DataModule1: TDataModule},
  UControleAbastecimento in 'Forms\UControleAbastecimento.pas' {fmControleAbastecimento},
  uFormat in 'Functions\uFormat.pas',
  URelatorioMov in 'Forms\URelatorioMov.pas' {fmRel};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
