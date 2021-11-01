unit UFmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UClienteDAO, Vcl.Menus, Vcl.Grids,
  UClienteController, UCliente, System.Classes, Entity,

  Generics.Collections,
  System.Generics.Collections, RTTI, UTstr, UUtil, UPais, UPaisController, UEstado,
  UEstadoController, UViaCep, UViaCepDados, MSXML, UEmail
  ;

type
  TFmPrincipal = class(TForm)
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
    edtBairro: TEdit;
    lblCidade: TLabel;
    edtCidade: TEdit;
    lblPais: TLabel;
    cmbPaises: TComboBox;
    lblEstado: TLabel;
    cmbEstados: TComboBox;
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
    procedure FormCreate(Sender: TObject);
    procedure sgrClientesDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure sgrClientesClick(Sender: TObject);
    procedure cmbPaisesSelect(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnValidarCEPClick(Sender: TObject);
  private

    PaisController:    TPaisController;
    Pais:              TPais;

    EstadoController:    TEstadoController;
    Estado:              TEstado;


    ClienteController:    TClienteController;
    Cliente:              TCliente;

    Procedure  ConfigurarStringGridClientes();
    Procedure  PopularPaises();
    Procedure  PopularEstados();
    Procedure  PopularClientes();
    Procedure  PopularGrid();
    Procedure  EstadoInicial();
    Procedure  LimparCampos();
    Procedure  HabilitarDesabilitarCampos(Status: Boolean);
    Procedure  PopularComboPaises();
    Procedure  PopularComboEstados(Pais: TPais);
    Function   ConstruirClienteFromView(): TCliente;
    Function   FindEstado(Estado: String;   Combo:  TComboBox): Integer;
    Procedure  GerarXMLCliente(Cliente:  TCliente);
    Procedure  EnviarEmailCliente(Cliente: TCliente);

  public
    { Public declarations }
  end;

var
  FmPrincipal: TFmPrincipal;

implementation

{$R *.dfm}



Procedure TFmPrincipal.btnCancelarClick(Sender: TObject);
Begin
   EstadoInicial();
End;

Procedure TFmPrincipal.btnExcluirClick(Sender: TObject);
Var
   Cliente:   TCliente;
Begin
   If (Length(Trim(edtCpf.Text)) > 0) Then
   Begin
      Cliente := TCliente.Create(edtCpf.Text);
      If (ClienteController.JaExisteEntidade(Cliente)) Then
      Begin
         ClienteController.Delete(Cliente);
         PopularGrid();
         ShowMessage('Operação realizada com sucesso.');
         btnCancelarClick(Sender);
      End
      Else
      Begin
         ShowMessage('O CPF: ' + edtCpf.Text + ' não pertence a nenhum Cliente.');
      End;
   End
   Else
   Begin
      ShowMessage('O CPF deve ser informado.');
   End;


End;

Procedure TFmPrincipal.btnNovoClick(Sender: TObject);
Var
   Cliente:   TCliente;
Begin
   If (Length(Trim(edtCpf.Text)) > 0) Then
   Begin
      Cliente := TCliente.Create(edtCpf.Text);
      If (Not ClienteController.JaExisteEntidade(Cliente)) Then
      Begin
         HabilitarDesabilitarCampos(True);
         edtNome.SetFocus();
         btnSalvar.Enabled := True;
      End
      Else
      Begin
         ShowMessage('O CPF: ' + edtCpf.Text + ' pertence a outro Cliente.');
      End;
   End
   Else
   Begin
      ShowMessage('O CPF deve ser informado.');
   End;
End;

Procedure TFmPrincipal.btnSairClick(Sender: TObject);
Begin
   Self.Close;
End;

Procedure TFmPrincipal.btnSalvarClick(Sender: TObject);
Begin
   Cliente := ConstruirClienteFromView();
   If (ClienteController.JaExisteEntidade(Cliente)) Then
   Begin
       ClienteController.Update(Cliente);
   End
   Else
   Begin
       ClienteController.Save(Cliente);
       GerarXMLCliente(Cliente);
       EnviarEmailCliente(Cliente);
   End;
   PopularGrid();
   ShowMessage('Operação realizada com sucesso.');
End;

Procedure TFmPrincipal.GerarXMLCliente(Cliente:  TCliente);
Const
      XmlCliente = '<Cliente>'+'</Cliente>';
Var
   NomeArq:           String;
   XmlDoc:            IXmlDomDocument;
   ClienteNode:       IXmlDomNode;
   Elemento:          IXMLDOMElement;

Begin
   NomeArq := 'Cliente'+Cliente.Cpf+'.xml';

   XmlDoc := CoDomDocument.Create;

   XmlDoc.loadXML(XmlCliente);
   ClienteNode := XmlDoc.selectSingleNode('/Cliente');

   Elemento := XmlDoc.createElement('CPF');
   Elemento.text := Cliente.Cpf;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('Nome');
   Elemento.text := Cliente.Nome;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('Identidade');
   Elemento.text := Cliente.Identidade;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('Telefone');
   Elemento.text := Cliente.Telefone;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('Logradouro');
   Elemento.text := Cliente.Endereco.Logradouro;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('Numero');
   Elemento.text := Cliente.Endereco.Numero;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('Complemento');
   Elemento.text := Cliente.Endereco.Complemento;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('Bairro');
   Elemento.text := Cliente.Endereco.Bairro;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('Cidade');
   Elemento.text := Cliente.Endereco.Cidade;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('CEP');
   Elemento.text := Cliente.Endereco.Cep;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('Estado');
   Elemento.text := Cliente.Endereco.Estado;
   ClienteNode.appendChild(Elemento);

   Elemento := XmlDoc.createElement('Pais');
   Elemento.text := Cliente.Endereco.Pais;
   ClienteNode.appendChild(Elemento);
   XmlDoc.save(NomeArq);
End;

Procedure TFmPrincipal.EnviarEmailCliente(Cliente: TCliente);
Begin
    TEmail.GetObjetoEmail.EnviarEmail('Erro','AAAAAAA');
End;


Procedure TFmPrincipal.btnValidarCEPClick(Sender: TObject);
Var
   ViaCep:  TViaCEP;
   Cep:     TViaCepDados;
   Estado:  TEstado;
   Ind:     Integer;
Begin
   ViaCep := TViaCEP.Create;
   If (ViaCEP.Validate(edtCep.Text)) Then
   Begin
      Cep := ViaCEP.Get(edtCep.Text);
      Try
         If (Not Assigned(Cep)) Then
            Raise Exception.Create('Erro: Os dados do endereço VIACEP não estão disponíveis para o CEP informado.')
         Else
         Begin
             edtCep.Text := Cep.Cep;
             edtLogradouro.Text := Cep.Logradouro;
             edtComplemento.Text := Cep.Complemento;
             edtBairro.Text := Cep.Bairro;
             edtCidade.Text := Cep.Localidade;

             PopularComboEstados(TPais.Create('BRA'));

             Estado := TEstado.Create('BRA',Cep.UF);
             If (Not EstadoController.JaExisteEntidade(Estado)) Then
             Begin
                Estado.Nome := Cep.UF+': Informar';
                EstadoController.Save(Estado);
                PopularComboEstados(TPais.Create('BRA'));
             End;
             ind := FindEstado(Cep.UF,   cmbEstados);
             cmbEstados.Text := (cmbEstados.Items.Objects[Ind] As TEstado).Nome;

             cmbPaises.Text := 'Brasil';
         End;
      Finally
         CEP.Free;
      End;
   End
   Else
      ShowMessage('CEP inválido');

End;

Function TFmPrincipal.FindEstado(Estado: String;   Combo:  TComboBox): Integer;
Var
   Ind:    Integer;
   Saida:  Integer;
Begin
   Saida := -1;
   Ind   := 0;
   While ((Ind < Combo.Items.Count) And (Saida = -1)) Do
   Begin
      If ((Combo.Items.Objects[Ind] As TEstado).Cod = Estado) Then
          Saida := Ind;
      Ind := Ind + 1;
   End;
   Result := Saida;
End;

Function TFmPrincipal.ConstruirClienteFromView(): TCliente;
Var
   Cliente:    TCliente;
   Ind:        Integer;
Begin
    Cliente                       := TCliente.Create();
    Cliente.Cpf                   := edtCpf.Text;
    Cliente.Nome                  := edtNome.Text;
    Cliente.Identidade            := edtIdentidade.Text;
    Cliente.Telefone              := edtTelefone.Text;
    Cliente.Email                 := edtEmail.Text;
    Cliente.Endereco.Logradouro   := edtLogradouro.Text;
    Cliente.Endereco.Numero       := edtNumero.Text;
    Cliente.Endereco.Complemento  := edtComplemento.Text;
    Cliente.Endereco.Cep          := edtCep.Text;
    Cliente.Endereco.Bairro       := edtBairro.Text;
    Cliente.Endereco.Cidade       := edtCidade.Text;

    ind := cmbEstados.Items.IndexOf(cmbEstados.Text);
    Cliente.Endereco.Estado       := (cmbEstados.Items.Objects[Ind] As TEstado).Cod;

    Ind := cmbPaises.Items.IndexOf(cmbPaises.Text);
    Cliente.Endereco.Pais         := (cmbPaises.Items.Objects[Ind] As TPais).Cod;

    Result := Cliente;
End;


Procedure TFmPrincipal.FormCreate(Sender: TObject);
Begin
   Self.Caption := 'Cadastro de Clientes';

   Self.PaisController := TPaisController.Create();
   Self.EstadoController := TEstadoController.Create();
   Self.ClienteController := TClienteController.Create();
   ConfigurarStringGridClientes();
   PopularPaises();
   PopularEstados();
   PopularClientes();
   PopularGrid();
   EstadoInicial();

End;

Procedure TFmPrincipal.cmbPaisesSelect(Sender: TObject);

Begin
   Pais := cmbPaises.Items.Objects[cmbPaises.ItemIndex] As TPais;
   PopularComboEstados(Pais);
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
   Ind:   Integer;
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
      edtBairro.Text         := sgrClientes.Cells[09, Lin];
      edtCidade.Text         := sgrClientes.Cells[10, Lin];

      cmbPaises.Text := sgrClientes.Cells[12, Lin];
      ind := cmbPaises.Items.IndexOf(sgrClientes.Cells[12, Lin]);
      PopularComboEstados(cmbPaises.Items.Objects[ind] As TPais);
      cmbEstados.Text := sgrClientes.Cells[11, Lin];

      btnNovo.Enabled := False;
      btnExcluir.Enabled := True;
      btnSalvar.Enabled := True;
      HabilitarDesabilitarCampos(True);
      edtCpf.Enabled := False;
      edtNome.SetFocus();
   End;
End;

Procedure TFmPrincipal.EstadoInicial();
Begin
   LimparCampos();
   HabilitarDesabilitarCampos(False);
   PopularComboPaises();

   edtCpf.Enabled := true;
   If (Self.Visible) Then
      edtCpf.SetFocus();
   cmbEstados.Clear;
   btnNovo.Enabled := True;
   btnSalvar.Enabled := False;
   btnExcluir.Enabled := False;

End;

Procedure TFmPrincipal.LimparCampos();
Begin
   edtCpf.Clear;
   edtNome.Clear;
   edtIdentidade.Clear;
   edtTelefone.Clear;
   edtEmail.Clear;
   edtLogradouro.Clear;
   edtNumero.Clear;
   edtComplemento.Clear;
   edtCep.Clear;
   edtBairro.Clear;
   edtCidade.Clear;
End;

Procedure TFmPrincipal.HabilitarDesabilitarCampos(Status:  Boolean);
Begin
   edtCpf.Enabled := Status;
   edtNome.Enabled := Status;
   edtIdentidade.Enabled := Status;
   edtTelefone.Enabled := Status;
   edtEmail.Enabled := Status;
   edtLogradouro.Enabled := Status;
   edtNumero.Enabled := Status;
   edtComplemento.Enabled := Status;
   edtCep.Enabled := Status;
   btnValidarCEP.Enabled := Status;
   edtBairro.Enabled := Status;
   edtCidade.Enabled := Status;
   cmbPaises.Enabled := Status;
   cmbEstados.Enabled := Status;
End;

Procedure TFmPrincipal.PopularComboPaises();
Var
   Entidade:    IEntity;
Begin
   cmbPaises.Clear;
   For Entidade In PaisController.FindAll() Do
   Begin
      Pais := Entidade As TPais;
      cmbPaises.AddItem(Pais.Nome, Pais);
   End;
End;

Procedure TFmPrincipal.PopularComboEstados(Pais:  TPais);
Var
   Entidade:    IEntity;
Begin
   cmbEstados.Clear;
   For Entidade In EstadoController.FindAll() Do
   Begin
      Estado := Entidade As TEstado;
      If (Estado.CodPais = Pais.Cod) Then
         cmbEstados.AddItem(Estado.Nome, Estado);
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
   Entidades:   TList<IEntity>;
   Entidade:    IEntity;
   Cliente:     TCliente;
   NomePais:    String;
   NomeEstado:  String;
Begin

   UUtil.LimparStringGrid(sgrClientes);
   Entidades := ClienteController.FindAll();

   For Entidade In Entidades Do
   Begin

      Cliente := Entidade As TCliente;

      Pais := TPais.Create(Cliente.Endereco.Pais);
      NomePais := (PaisController.FindById(Pais) As TPais).Nome;

      Estado := TEstado.Create(Cliente.Endereco.Pais, Cliente.Endereco.Estado);
      NomeEstado := (EstadoController.FindById(Estado) As TEstado).Nome;


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
      sgrClientes.Cells[11, sgrClientes.RowCount - 1] := NomeEstado;
      sgrClientes.Cells[12, sgrClientes.RowCount - 1] := NomePais;
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
Procedure TFmPrincipal.PopularPaises();
Begin
   Self.Pais := TPais.Create();
   Self.Pais.Cod  := 'BRA';
   Self.Pais.Nome := 'Brasil';
   Self.PaisController.Save(Self.Pais);

   Self.Pais := TPais.Create();
   Self.Pais.Cod  := 'USA';
   Self.Pais.Nome := 'Estados Unidos da America';
   Self.PaisController.Save(Self.Pais);

   Self.Pais := TPais.Create();
   Self.Pais.Cod  := 'AUS';
   Self.Pais.Nome := 'Austrália';
   Self.PaisController.Save(Self.Pais);

   Self.Pais := TPais.Create();
   Self.Pais.Cod  := 'DEU';
   Self.Pais.Nome := 'Alemanha';
   Self.PaisController.Save(Self.Pais);
End;


Procedure TFmPrincipal.PopularEstados();
Begin
   Self.Estado := TEstado.Create();
   Self.Estado.CodPais  := 'BRA';
   Self.Estado.Cod      := 'BA';
   Self.Estado.Nome     := 'Bahia';
   Self.EstadoController.Save(Self.Estado);

   Self.Estado := TEstado.Create();
   Self.Estado.CodPais  := 'BRA';
   Self.Estado.Cod      := 'MG';
   Self.Estado.Nome     := 'Minas Gerais';
   Self.EstadoController.Save(Self.Estado);

   Self.Estado := TEstado.Create();
   Self.Estado.CodPais  := 'BRA';
   Self.Estado.Cod      := 'SP';
   Self.Estado.Nome     := 'São Paulo';
   Self.EstadoController.Save(Self.Estado);

   Self.Estado := TEstado.Create();
   Self.Estado.CodPais  := 'USA';
   Self.Estado.Cod      := 'CA';
   Self.Estado.Nome     := 'Califórnia';
   Self.EstadoController.Save(Self.Estado);

   Self.Estado := TEstado.Create();
   Self.Estado.CodPais  := 'USA';
   Self.Estado.Cod      := 'FL';
   Self.Estado.Nome     := 'Flórida';
   Self.EstadoController.Save(Self.Estado);

   Self.Estado := TEstado.Create();
   Self.Estado.CodPais  := 'USA';
   Self.Estado.Cod      := 'NV';
   Self.Estado.Nome     := 'Nevada';
   Self.EstadoController.Save(Self.Estado);

   Self.Estado := TEstado.Create();
   Self.Estado.CodPais  := 'AUS';
   Self.Estado.Cod      := 'AU-QLD';
   Self.Estado.Nome     := 'Queensland';
   Self.EstadoController.Save(Self.Estado);

   Self.Estado := TEstado.Create();
   Self.Estado.CodPais  := 'AUS';
   Self.Estado.Cod      := 'AU-TAS';
   Self.Estado.Nome     := 'Tasmânia';
   Self.EstadoController.Save(Self.Estado);

   Self.Estado := TEstado.Create();
   Self.Estado.CodPais  := 'DEU';
   Self.Estado.Cod      := 'BE';
   Self.Estado.Nome     := 'Berlim';
   Self.EstadoController.Save(Self.Estado);

   Self.Estado := TEstado.Create();
   Self.Estado.CodPais  := 'DEU';
   Self.Estado.Cod      := 'BB';
   Self.Estado.Nome     := 'Brandemburgo';
   Self.EstadoController.Save(Self.Estado);
End;


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
   Self.Cliente.Endereco.Pais        := 'BRA';
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
   Self.Cliente.Endereco.Pais        := 'BRA';
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
   Self.Cliente.Endereco.Pais        := 'BRA';
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
   Self.Cliente.Endereco.Pais        := 'BRA';
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
   Self.Cliente.Endereco.Pais        := 'BRA';
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
   Self.Cliente.Endereco.Pais        := 'BRA';
   Self.Cliente.Endereco.Cep         := '40140390';

   Self.ClienteController.Save(Self.Cliente);
End;



end.
