unit uiConfig;

interface

  Type
  IConfig = interface
    procedure setTypeDataBase(const Value : Integer);
    function getTypeDataBase : Integer;
    property TypeDataBase : Integer read getTypeDataBase write setTypeDataBase;
  end;


implementation



end.
