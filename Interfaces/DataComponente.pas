unit DataComponente;

interface

   Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Generics.Collections,  RTTI,


     Entity;

   type

      IDataComponente = Interface
         ['{A7BBCDBF-D244-4972-A433-D4ACEF97754F}']

         Function   FindAll() : TList<IEntity>;
         Function   FindById(Entity: IEntity): IEntity;
         Function   Save(Entity : IEntity): IEntity;
         Function   Update(Entity : IEntity): IEntity;
         Procedure  Delete(Entity : IEntity);
         Function   FindByParam(Param: String; Value: TValue): TList<IEntity>;
         Function   JaExisteEntidade(const Entity: IEntity):  Boolean;
   End;



implementation

end.
