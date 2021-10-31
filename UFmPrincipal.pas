unit UFmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UClienteDAO, Vcl.Menus, Vcl.Grids,
  UClienteController, UCliente, System.Classes, Entity,

  Generics.Collections,
  System.Generics.Collections, RTTI, UTstr
  ;

type
  TFmPrincipal = class(TForm)
    Button1: TButton;
    lblCpf: TLabel;
    edtCpf: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    lblIdentidade: TLabel;
    edtIdentidade: TEdit;
    lblTelefone: TLabel;
    edtTelefone: TEdit;
    lblEmail: TLabel;
    edtEmail: TEdit;
    lblCep: TLabel;
    edtCep: TEdit;
    btnValidarCEP: TButton;
    lblLogradouro: TLabel;
    edtLogradouro: TEdit;
    lblNumero: TLabel;
    edtNumero: TEdit;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    lblBairro: TLabel;
    edtBairo: TEdit;
    lblCidade: TLabel;
    edtCidade: TEdit;
    lblPais: TLabel;
    cmbPais: TComboBox;
    lblEstado: TLabel;
    cmbEstado: TComboBox;
    lblListaClientes: TLabel;
    lblFiltro: TLabel;
    cmbFiltro: TComboBox;
    edtFiltro: TEdit;
    btnFiltrar: TButton;
    btnLimparFiltro: TButton;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    btnCancelar: TButton;
    btnSair: TButton;
    sgrClientes: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgrClientesDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure sgrClientesClick(Sender: TObject);
  private

    ClienteController:    TClienteController;
    Cliente:              TCliente;

    Procedure  ConfigurarStringGridClientes();
    Procedure  PopularClientes();
    Procedure  PopularGrid();
  public
    { Public declarations }
  end;

var
  FmPrincipal: TFmPrincipal;

implementation

{$R *.dfm}



Procedure TFmPrincipal.Button1Click(Sender: TObject);

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

Procedure TFmPrincipal.FormCreate(Sender: TObject);
Begin
   Self.Caption := 'Cadastro de Clientes';

   Self.ClienteController := TClienteController.Create();
   ConfigurarStringGridClientes();
   PopularClientes();
   PopularGrid()

End;

Procedure TFmPrincipal.ConfigurarStringGridClientes();
Begin
   sgrClientes.RowCount := 2;
   sgrClientes.ColCount := 13;
   sgrClientes.DefaultColWidth := 200;
   sgrClientes.FixedRows := 1;
   sgrClientes.FixedCols := 0;

   sgrClientes.Brush.Style := (bsSolid);
   sgrClientes.Canvas.Pen.Style := TPenStyle.psSolid;
   sgrClientes.Canvas.Font.Style := [fsBold];

   sgrClientes.Cells[00,0] := 'CPF';
   sgrClientes.Cells[01,0] := 'Nome';
   sgrClientes.Cells[02,0] := 'Identidade';
   sgrClientes.Cells[03,0] := 'Telefone';
   sgrClientes.Cells[04,0] := 'E-mail';
   sgrClientes.Cells[05,0] := 'Logradouro';
   sgrClientes.Cells[06,0] := 'Número';
   sgrClientes.Cells[07,0] := 'Complemento';
   sgrClientes.Cells[08,0] := 'CEP';
   sgrClientes.Cells[09,0] := 'Bairro';
   sgrClientes.Cells[10,0] := 'Cidade';
   sgrClientes.Cells[11,0] := 'Estado';
   sgrClientes.Cells[12,0] := 'País';
End;




Procedure TFmPrincipal.sgrClientesClick(Sender: TObject);
Var
   Lin:   Integer;
   Cpf:   String;
Begin
   Lin := sgrClientes.Row;
   Cpf := sgrClientes.Cells[0, Lin];
   If (Length(Trim(Cpf)) > 0) Then
   Begin
      edtCpf.Text            := sgrClientes.Cells[00, Lin];
      edtNome.Text           := sgrClientes.Cells[01, Lin];
      edtIdentidade.Text     := sgrClientes.Cells[02, Lin];
      edtTelefone.Text       := sgrClientes.Cells[03, Lin];
      edtEmail.Text          := sgrClientes.Cells[04, Lin];
      edtLogradouro.Text     := sgrClientes.Cells[05, Lin];
      edtNumero.Text         := sgrClientes.Cells[06, Lin];
      edtComplemento.Text    := sgrClientes.Cells[07, Lin];
      edtCep.Text            := sgrClientes.Cells[08, Lin];
      edtBairo.Text          := sgrClientes.Cells[09, Lin];
      edtCidade.Text         := sgrClientes.Cells[10, Lin];

      btnNovo.Enabled := False;

   End;




End;

Procedure TFmPrincipal.sgrClientesDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
Var
   Texto: String;
Begin

   Texto := sgrClientes.Cells[ACol, ARow];
   If (ARow = 0)  Then
   Begin
      sgrClientes.Canvas.Brush.Color := clMoneyGreen;
      sgrClientes.Canvas.FillRect(Rect);

//    Rect.Top := Rect.Top + 5;
//    DrawText(sgrClientes.Canvas.Handle, PChar(Texto), Length(Texto), Rect, DT_CENTER );

      sgrClientes.Canvas.TextOut(Rect.Left + 5, Rect.Top + 5, TStr.Space(100));
      sgrClientes.Canvas.TextOut(Rect.Left + 5, Rect.Top + 5, Texto);
   End
   Else
      sgrClientes.Canvas.Brush.Color := clWhite;


end;

Procedure TFmPrincipal.PopularGrid();
Var
   Ind:         Integer;
   Entidades:   TList<IEntity>;
   Entidade:    IEntity;
   Cliente:     TCliente;
Begin
   sgrClientes.RowCount := 2;
   For Ind := 0 To sgrClientes.ColCount - 1 Do
       sgrClientes.Cells[Ind, 1] := '';
   Entidades := ClienteController.FindAll();

   For Entidade In Entidades Do
   Begin
      Cliente := Entidade As TCliente;
      sgrClientes.Cells[00, sgrClientes.RowCount - 1] := Cliente.Cpf;
      sgrClientes.Cells[01, sgrClientes.RowCount - 1] := Cliente.Nome;
      sgrClientes.Cells[02, sgrClientes.RowCount - 1] := Cliente.Identidade;
      sgrClientes.Cells[03, sgrClientes.RowCount - 1] := Cliente.Telefone;
      sgrClientes.Cells[04, sgrClientes.RowCount - 1] := Cliente.Email;
      sgrClientes.Cells[05, sgrClientes.RowCount - 1] := Cliente.Endereco.Logradouro;
      sgrClientes.Cells[06, sgrClientes.RowCount - 1] := Cliente.Endereco.Numero;
      sgrClientes.Cells[07, sgrClientes.RowCount - 1] := Cliente.Endereco.Complemento;
      sgrClientes.Cells[08, sgrClientes.RowCount - 1] := Cliente.Endereco.Cep;
      sgrClientes.Cells[09, sgrClientes.RowCount - 1] := Cliente.Endereco.Bairro;
      sgrClientes.Cells[10, sgrClientes.RowCount - 1] := Cliente.Endereco.Cidade;
      sgrClientes.Cells[11, sgrClientes.RowCount - 1] := Cliente.Endereco.Estado;
      sgrClientes.Cells[12, sgrClientes.RowCount - 1] := Cliente.Endereco.Pais;
      sgrClientes.RowCount := sgrClientes.RowCount + 1;

   End;


End;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Procedure TFmPrincipal.PopularClientes();
Begin
   Self.Cliente := TCliente.Create();

   Self.Cliente.Cpf          := '1234';
   Self.Cliente.Nome         := 'Paulo';
   Self.Cliente.Identidade   := '7AB5';
   Self.Cliente.Telefone     := '71-111';
   Self.Cliente.Email        := 'plopes100@gmail.com';
   Self.Cliente.Endereco.Logradouro  := 'RUA A';
   Self.Cliente.Endereco.Numero      := '22';
   Self.Cliente.Endereco.Complemento := 'Edf X';
   Self.Cliente.Endereco.Bairro      := 'Barra';
   Self.Cliente.Endereco.Cidade      := 'Salvador';
   Self.Cliente.Endereco.Estado      := 'BA';
   Self.Cliente.Endereco.Pais        := 'Brasil';
   Self.Cliente.Endereco.Cep         := '40140390';

   Self.ClienteController.Save(Self.Cliente);



   Self.Cliente := TCliente.Create();

   Self.Cliente.Cpf          := '1235';
   Self.Cliente.Nome         := 'Ana';
   Self.Cliente.Identidade   := '177Y';
   Self.Cliente.Telefone     := '71-222';
   Self.Cliente.Email        := 'plopes100@gmail.com';
   Self.Cliente.Endereco.Logradouro  := 'RUA B';
   Self.Cliente.Endereco.Numero      := '23';
   Self.Cliente.Endereco.Complemento := 'Edf Y';
   Self.Cliente.Endereco.Bairro      := 'Pituba';
   Self.Cliente.Endereco.Cidade      := 'Salvador';
   Self.Cliente.Endereco.Estado      := 'BA';
   Self.Cliente.Endereco.Pais        := 'Brasil';
   Self.Cliente.Endereco.Cep         := '40140390';

   Self.ClienteController.Save(Self.Cliente);

   Self.Cliente := TCliente.Create();

   Self.Cliente.Cpf          := '1236';
   Self.Cliente.Nome         := 'Rita';
   Self.Cliente.Identidade   := 'AB6T';
   Self.Cliente.Telefone     := '71-333';
   Self.Cliente.Email        := 'plopes100@gmail.com';
   Self.Cliente.Endereco.Logradouro  := 'RUA C';
   Self.Cliente.Endereco.Numero      := '24';
   Self.Cliente.Endereco.Complemento := 'Edf Z';
   Self.Cliente.Endereco.Bairro      := 'Centro';
   Self.Cliente.Endereco.Cidade      := 'Belo Horizonte';
   Self.Cliente.Endereco.Estado      := 'MG';
   Self.Cliente.Endereco.Pais        := 'Brasil';
   Self.Cliente.Endereco.Cep         := '40140390';

   Self.ClienteController.Save(Self.Cliente);

   Self.Cliente := TCliente.Create();

   Self.Cliente.Cpf          := '1239';
   Self.Cliente.Nome         := 'Ilma';
   Self.Cliente.Identidade   := '6612';
   Self.Cliente.Telefone     := '71-777';
   Self.Cliente.Email        := 'plopes100@gmail.com';
   Self.Cliente.Endereco.Logradouro  := 'RUA U';
   Self.Cliente.Endereco.Numero      := '16';
   Self.Cliente.Endereco.Complemento := 'Edf K';
   Self.Cliente.Endereco.Bairro      := 'Centro';
   Self.Cliente.Endereco.Cidade      := 'Belo Horizonte';
   Self.Cliente.Endereco.Estado      := 'MG';
   Self.Cliente.Endereco.Pais        := 'Brasil';
   Self.Cliente.Endereco.Cep         := '40140390';

   Self.ClienteController.Save(Self.Cliente);

   Self.Cliente := TCliente.Create();

   Self.Cliente.Cpf          := '1237';
   Self.Cliente.Nome         := 'Carlos';
   Self.Cliente.Identidade   := 'JK09';
   Self.Cliente.Telefone     := '71-444';
   Self.Cliente.Email        := 'plopes100@gmail.com';
   Self.Cliente.Endereco.Logradouro  := 'RUA D';
   Self.Cliente.Endereco.Numero      := '25';
   Self.Cliente.Endereco.Complemento := 'Edf A';
   Self.Cliente.Endereco.Bairro      := 'Centro';
   Self.Cliente.Endereco.Cidade      := 'Belo Horizonte';
   Self.Cliente.Endereco.Estado      := 'MG';
   Self.Cliente.Endereco.Pais        := 'Brasil';
   Self.Cliente.Endereco.Cep         := '40140390';

   Self.ClienteController.Save(Self.Cliente);

   Self.Cliente := TCliente.Create();

   Self.Cliente.Cpf          := '1238';
   Self.Cliente.Nome         := 'Marília';
   Self.Cliente.Identidade   := '12YY';
   Self.Cliente.Telefone     := '71-888';
   Self.Cliente.Email        := 'plopes100@gmail.com';
   Self.Cliente.Endereco.Logradouro  := 'RUA J';
   Self.Cliente.Endereco.Numero      := '33';
   Self.Cliente.Endereco.Complemento := 'Edf W';
   Self.Cliente.Endereco.Bairro      := 'Barra';
   Self.Cliente.Endereco.Cidade      := 'Salvador';
   Self.Cliente.Endereco.Estado      := 'BA';
   Self.Cliente.Endereco.Pais        := 'Brasil';
   Self.Cliente.Endereco.Cep         := '40140390';

   Self.ClienteController.Save(Self.Cliente);
End;



end.
