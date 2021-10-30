unit Entity;

interface



   type

      IEntity = Interface (IInterface)
      ['{668DB2F4-6E66-4501-B87A-D7D238EF0890}']



          Function  getKey(): String;
          Function  getMensagem(ind: Integer): String;
          Function  existeEntity(Param: String; value: TObject): Boolean;
      End;



implementation

end.
