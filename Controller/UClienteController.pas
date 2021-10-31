Unit UClienteController;

Interface

uses DataComponente, Entity, Generics.Collections, System.Classes,
  System.Generics.Collections, System.SysUtils, RTTI, UBaseDAO;

   Type
      TClienteController = Class
         Private

            BaseDAO:    TBaseDAO;
         Public

            Constructor Create();
            Destructor  Destroy();       Override;

            Function   FindAll() : TList<IEntity>;
            Function   FindById(Entity: IEntity): IEntity;
            Function   Save(Entity : IEntity): IEntity;
            Function   Update(Entity : IEntity): IEntity;
            Procedure  Delete(Entity : IEntity);
            Function   FindByParam(Param: String; Value: TValue): TList<IEntity>;
      End;

Implementation

   Constructor TClienteController.Create;
   Begin
      BaseDAO := TBaseDAO.Create();
   End;

   Destructor TClienteController.Destroy();
   Begin
      FreeAndNil(BaseDAO);
      Inherited Destroy();
   End;


   Function   TClienteController.FindAll() : TList<IEntity>;
   Var
       Saida:  TList<IEntity>;
       Entity: IEntity;
   Begin
      Result := BaseDAO.FindAll
   End;


   Function   TClienteController.FindById(Entity: IEntity): IEntity;
   Begin
      Result := BaseDAO.FindById(Entity);
   End;

   Function   TClienteController.Save(Entity : IEntity): IEntity;
   Begin
      Basedao.Save(Entity);
   End;

   Function   TClienteController.Update(Entity : IEntity): IEntity;
   Begin
      BaseDAO.Update(Entity);
   End;

   Procedure  TClienteController.Delete(Entity : IEntity);
   Begin
      BaseDAO.Delete(Entity);
   End;

   Function   TClienteController.FindByParam(Param: String; Value: TValue): TList<IEntity>;
   Begin
      Result := BaseDAO.FindByParam(Param, Value);
   End;

End.

