Unit UBaseDAO;

Interface

uses DataComponente, Entity, Generics.Collections, System.Classes,
  System.Generics.Collections, System.SysUtils, RTTI;

   Type
      TBaseDAO = Class(TInterfacedObject, IDataComponente)
         Private

            FDB:    TDictionary<String,IEntity>;
         Public

            Constructor Create();

            Function   FindAll() : TList<IEntity>;
            Function   FindById(Entity: IEntity): IEntity;
            Function   Save(Entity : IEntity): IEntity;
            Function   Update(Entity : IEntity): IEntity;
            Procedure  Delete(Entity : IEntity);
            Function   FindByParam(Param: String; Value: TValue): TList<IEntity>;
      End;

Implementation

   Constructor TBaseDAO.Create;
   Begin
      FDB := TDictionary<String,IEntity>.Create();
   End;


   Function   TBaseDAO.FindAll() : TList<IEntity>;
   Var
       Saida:  TList<IEntity>;
       Ent:    IEntity;
   Begin
      Saida := Tlist<IEntity>.Create();

      For Ent in FDB.Values Do
      Begin
         Saida.Add(Ent);
      End;
      Result := Saida;

   End;


   Function   TBaseDAO.FindById(Entity: IEntity): IEntity;
   Begin
      If (FDB.ContainsKey(Entity.getKey())) Then
      Begin
         Result := FDB.Items[Entity.getKey()];
      End
      Else
      Begin
         Raise Exception.Create(Entity.getMensagem(1));
      End;

   End;

   Function   TBaseDAO.Save(Entity : IEntity): IEntity;
   Begin

      If (Not FDB.ContainsKey(Entity.getKey())) Then
      Begin
         FDB.Add(Entity.getKey(), Entity);
      End
      Else
      Begin
         Raise Exception.Create(Entity.getMensagem(2));
      End;



   End;

   Function   TBaseDAO.Update(Entity : IEntity): IEntity;
   Begin
      If (FDB.ContainsKey(Entity.getKey)) Then
      Begin
         FDB.Items[Entity.getKey] := Entity;
      End
      Else
      Begin
         Raise Exception.Create(Entity.getMensagem(1));
      End;
   End;

   Procedure  TBaseDAO.Delete(Entity : IEntity);
   Begin
      If (FDB.ContainsKey(Entity.getKey)) Then
      Begin
         FDB.Remove(Entity.getKey);
      End
      Else
      Begin
         Raise Exception.Create(Entity.getMensagem(1));
      End;

   End;

   Function   TBaseDAO.FindByParam(Param: String; Value: TValue): TList<IEntity>;
   Var
       Saida:  TList<IEntity>;
       Entity: IEntity;
   Begin
      Saida := Tlist<IEntity>.Create();

      For Entity in FDB.Values Do
      Begin
         If (Entity.existeEntity(Param, Value)) Then
         Begin
            Saida.Add(Entity);
         End;
      End;
      Result := Saida;

   End;

End.
