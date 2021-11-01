Unit UBaseController;

Interface

uses DataComponente, Entity, Generics.Collections, System.Classes,
  System.Generics.Collections, System.SysUtils, RTTI, UBaseDAO;

   Type
      TBaseController = Class
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
            Function   JaExisteEntidade(const Entity: IEntity): Boolean;
      End;

Implementation

   Constructor TBaseController.Create;
   Begin
      BaseDAO := TBaseDAO.Create();
   End;

   Destructor TBaseController.Destroy();
   Begin
      FreeAndNil(BaseDAO);
      Inherited Destroy();
   End;


   Function   TBaseController.FindAll() : TList<IEntity>;
   Begin
      Result := BaseDAO.FindAll
   End;


   Function   TBaseController.FindById(Entity: IEntity): IEntity;
   Begin
      Result := BaseDAO.FindById(Entity);
   End;

   Function   TBaseController.Save(Entity : IEntity): IEntity;
   Begin
      Basedao.Save(Entity);
   End;

   Function   TBaseController.Update(Entity : IEntity): IEntity;
   Begin
      BaseDAO.Update(Entity);
   End;

   Procedure  TBaseController.Delete(Entity : IEntity);
   Begin
      BaseDAO.Delete(Entity);
   End;

   Function   TBaseController.FindByParam(Param: String; Value: TValue): TList<IEntity>;
   Begin
      Result := BaseDAO.FindByParam(Param, Value);
   End;

   Function   TBaseController.JaExisteEntidade(const Entity: IEntity): Boolean;
   Begin
      Result := BaseDAO.JaExisteEntidade(Entity);
   End;

End.

