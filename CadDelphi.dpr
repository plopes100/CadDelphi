program CadDelphi;

uses
  Vcl.Forms,
  UFmPrincipal in 'UFmPrincipal.pas' {FmPrincipal},
  DataComponente in 'Interfaces\DataComponente.pas',
  Entity in 'Interfaces\Entity.pas',
  UBaseDAO in 'DAO\UBaseDAO.pas',
  UCliente in 'Entity\UCliente.pas',
  UClienteDAO in 'DAO\UClienteDAO.pas',
  UClienteController in 'Controller\UClienteController.pas',
  UTstr in 'Utils\UTstr.Pas',
  UUtil in 'Utils\UUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmPrincipal, FmPrincipal);
  Application.Run;
end.
