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
  UUtil in 'Utils\UUtil.pas',
  UPais in 'Entity\UPais.pas',
  UPaisDAO in 'DAO\UPaisDAO.pas',
  UBaseController in 'Controller\UBaseController.pas',
  UPaisController in 'Controller\UPaisController.pas',
  UEstado in 'Entity\UEstado.pas',
  UEstadoDAO in 'DAO\UEstadoDAO.pas',
  UEstadoController in 'Controller\UEstadoController.pas',
  UViaCep in 'Utils\UViaCep.pas',
  UViaCepDados in 'Utils\UViaCepDados.pas',
  UEmail in 'Utils\UEmail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmPrincipal, FmPrincipal);
  Application.Run;
end.
