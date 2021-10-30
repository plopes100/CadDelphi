program CadDelphi;

uses
  Vcl.Forms,
  UFmPrincipal in 'UFmPrincipal.pas' {Form1},
  DataComponente in 'Interfaces\DataComponente.pas',
  Entity in 'Interfaces\Entity.pas',
  UClienteDAO in 'DAO\UClienteDAO.pas',
  UCliente in 'Entity\UCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
