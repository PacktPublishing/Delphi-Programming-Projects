unit uiRepoSystem;

interface

uses
  uUsers, uCustomers, uProducts;

Type
  IRepoSystem = interface
    function ReturnUser ( id : integer ) : TUser;
    function ReturnCustomer( id : integer) : TCustomer;
    function ReturnProduct( id : integer) : TProducts;
  end;

implementation

end.
