Unit UPais;

Interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Entity, Rtti;


   Type

      TPais = Class(TInterfacedObject,  IEntity)

         Private
            FCod:           String;
            FNome:          String;

         Public

            Constructor Create();              Overload;
            Constructor Create(Cod: String);   Overload;
            Function  getKey():  String;
            Function  getMensagem(Ind: Integer): String;
            Function  existeEntity(Param: String; Value: TValue): Boolean;

            Property      Cod           : String       Read FCod            Write FCod;
            Property      Nome          : String       Read FNome           Write FNome;

      End;


Implementation

   Constructor TPais.Create();
   Begin
   End;

   Constructor TPais.Create(Cod: String);
   Begin
      Inherited Create();
      FCod := Cod;
   End;

   Function  TPais.getKey(): String;
   Begin
      Result := FCod;
   End;

   Function  TPais.getMensagem(Ind: Integer): String;
   Begin
      If (Ind = 1) Then
        Result := 'O País com Código: '+Cod+' não foi localizado';
      If (Ind = 2) Then
        Result := 'O País com Código '+Cod+' já está cadastrado';
   End;

   Function  TPais.existeEntity(Param: String; Value: TValue): Boolean;
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
