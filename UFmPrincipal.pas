unit UFmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UCliente,
 RTTI;

Procedure TForm1.Button1Click(Sender: TObject);

Var
     c,d,e: TCliente;
     dao: TClienteDAO;
      ctxRtti  : TRttiContext;
      typeRtti : TRttiType;
      propRtti : TRttiProperty;
      z: TValue;



Begin
     c := TCliente.Create();
     dao := TClienteDAO.Create();

     c.Cpf := '123';
     c.Nome := 'Paulo';

     dao.Save(c);

     d := TCliente.Create('123');
     d := dao.FindById(d) as TCliente;

     ShowMessage(d.Cpf+'   '+d.Nome);

     d.Nome := 'Carlos';
     dao.Update(d);

     e := TCliente.Create('123');
     e := dao.FindById(e) as TCliente;

     ShowMessage(e.Cpf+'   '+e.Nome);

      ctxRtti  := TRttiContext.Create;
      typeRtti := ctxRtti.GetType( d.ClassType );
      propRtti := typeRtti.GetProperty('Nome');

      z := propRtti.GetValue(d);
      ShowMessage(z.AsString);
      ctxRtti.Free;


End;

end.
