program CadDelphi;

uses
  Vcl.Forms,
  UFmPrincipal in 'UFmPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
