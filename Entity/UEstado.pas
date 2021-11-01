Unit UEstado;

Interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Entity, Rtti;


   Type

      TEstado = Class(TInterfacedObject,  IEntity)

         Private
            FCodPais:       String;
            FCod:           String;
            FNome:          String;

         Public

            Constructor Create();                               Overload;
            Constructor Create(CodPais: String; Cod: String);   Overload;
            Function  getKey():  String;
            Function  getMensagem(Ind: Integer): String;
            Function  existeEntity(Param: String; Value: TValue): Boolean;

            Property      CodPais       : String       Read FCodPais        Write FCodPais;
            Property      Cod           : String       Read FCod            Write FCod;
            Property      Nome          : String       Read FNome           Write FNome;

      End;


Implementation

   Constructor TEstado.Create();
   Begin
   End;

   Constructor TEstado.Create(CodPais: String; Cod: String);
   Begin
      Inherited Create();
      FCodPais := CodPais;
      FCod := Cod;
   End;

   Function  TEstado.getKey(): String;
   Begin
      Result := FCodPais+FCod;
   End;

   Function  TEstado.getMensagem(Ind: Integer): String;
   Begin
      If (Ind = 1) Then
        Result := 'O Estado com Código: '+Cod+' não foi localizado no País de Código: '+ CodPais;
      If (Ind = 2) Then
        Result := 'O Estado com Código '+Cod+' já está cadastrado no País de Código: '+ CodPais;
   End;

   Function  TEstado.existeEntity(Param: String; Value: TValue): Boolean;
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
