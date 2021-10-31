Unit UCliente;

Interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Entity, Rtti;


   Type

      TEndereco = Class

         Private
            FCep           : String;
            FLogradouro    : String;
            FNumero        : String;
            FComplemento   : String;
            FBairro        : String;
            FCidade        : String;
            FEstado        : String;
            FPais          : String;

         Public
            Property      Cep           : String    Read FCep            Write FCep;
            Property      Logradouro    : String    Read FLogradouro     Write FLogradouro;
            Property      Numero        : String    Read FNumero         Write FNumero;
            Property      Complemento   : String    Read FComplemento    Write FComplemento;
            Property      Bairro        : String    Read FBairro         Write FBairro;
            Property      Cidade        : String    Read FCidade         Write FCidade;
            Property      Estado        : String    Read FEstado         Write FEstado;
            Property      Pais          : String    Read FPais           Write FPais;

      End;

      TCliente = Class(TInterfacedObject,  IEntity)

         Private
            FCpf:           String;
            FNome:          String;
            FIdentidade:    String;
            FTelefone:      String;
            FEmail:         String;
            FEndereco:      TEndereco;

         Public

            Constructor Create();              Overload;
            Constructor Create(Cpf: String);   Overload;
            Destructor Destroy; override;
            Function  getKey():  String;
            Function  getMensagem(Ind: Integer): String;
            Function  existeEntity(Param: String; Value: TValue): Boolean;



            Property      Cpf           : String       Read FCpf            Write FCpf;
            Property      Nome          : String       Read FNome           Write FNome;
            Property      Identidade    : String       Read FIdentidade     Write FIdentidade;
            Property      Telefone      : String       Read FTelefone       Write FTelefone;
            Property      Email         : String       Read FEmail          Write FEmail;
            Property      Endereco      : TEndereco    Read FEndereco       Write FEndereco;

      End;


Implementation

   Constructor TCliente.Create();
   Begin
      Endereco := TEndereco.Create();
   End;

   Constructor TCliente.Create(Cpf: String);
   Begin
      Inherited Create();
      FCpf := Cpf;
   End;



   Destructor TCliente.Destroy();
   Begin
      Inherited Destroy;
      FreeAndNil(FEndereco);
   End;

   Function  TCliente.getKey(): String;
   Begin
      Result := FCpf;
   End;

   Function  TCliente.getMensagem(Ind: Integer): String;
   Begin
      If (Ind = 1) Then
        Result := 'O Cliente com CPF: '+Cpf+' não foi localizado';
      If (Ind = 2) Then
        Result := 'O Cliente com CPF: '+Cpf+' já está cadastrado';
   End;

   Function  TCliente.existeEntity(Param: String; Value: TValue): Boolean;
   var
      ctxRtti  : TRttiContext;
      typeRtti : TRttiType;
      propRtti : TRttiProperty;

   Begin
      ctxRtti  := TRttiContext.Create;
      typeRtti := ctxRtti.GetType( self.ClassType );
      propRtti := typeRtti.GetProperty(Param);
      Result := Value.AsString = propRtti.GetValue(self).AsString;
      ctxRtti.Free;
   End;

End.
