unit uRepositorySystemSQLServer;

interface

uses
  Dialogs, uDM_RepositorySQLServer, uiRepoSystem, uCustomers, uUsers, uProducts,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM_RepositorySystemSQLServer = class(TDataModule, IRepoSystem)
    QryCustomerSQLServer: TFDQuery;
    QryUserSQLServer: TFDQuery;
    QryProductSQLServer: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function ReturnCustomer(id: Integer): TCustomer;
    function ReturnProduct(id: Integer): TProducts;
    function ReturnUser(id: Integer): TUser;

  end;

var
  DM_RepositorySystemSQLServer: TDM_RepositorySystemSQLServer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_RepositorySystemSQLServer }

function TDM_RepositorySystemSQLServer.ReturnCustomer(id: Integer): TCustomer;
begin
  Try
    QryCustomerSQLServer.Close;
    QryCustomerSQLServer.ParamByName('id').Value := id;
    QryCustomerSQLServer.Open;

    if not QryCustomerSQLServer.IsEmpty then
      begin
        Result := TCustomer.Create;
        Result.id := QryCustomerSQLServer.FieldByName('id_customer').AsInteger;
        Result.name := QryCustomerSQLServer.FieldByName('customer_name').AsString;
        Result.status := QryCustomerSQLServer.FieldByName('customer_status').AsInteger;
      end
    else
      Result := nil;
  Except
    On E : Exception do
      ShowMessage(E.Message);
  End;
end;

function TDM_RepositorySystemSQLServer.ReturnProduct(id: Integer): TProducts;
begin
  Try
    QryProductSQLServer.Close;
    QryProductSQLServer.ParamByName('id').Value := id;
    QryProductSQLServer.Open;

    if not QryProductSQLServer.IsEmpty then
      begin
        Result := TProducts.Create;
        Result.id := QryProductSQLServer.FieldByName('id_product').AsInteger;
        Result.code := QryProductSQLServer.FieldByName('code').AsString;
        Result.descr := QryProductSQLServer.FieldByName('descr').AsString;
        Result.list_price := QryProductSQLServer.FieldByName('list_price').AsFloat;
        Result.tax :=  QryProductSQLServer.FieldByName('tax').AsFloat;
        Result.quantity := QryProductSQLServer.FieldByName('quantity').AsFloat;
      end
    else
      Result := nil;
  Except
    On E : Exception do
      ShowMessage(E.Message);
  End;
end;

function TDM_RepositorySystemSQLServer.ReturnUser(id: Integer): TUser;
begin
  Try
    QryUserSQLServer.Close;
    QryUserSQLServer.ParamByName('id').Value := id;
    QryUserSQLServer.Open;

    if not QryUserSQLServer.IsEmpty then
      begin
        Result := TUser.Create;
        Result.id := QryUserSQLServer.FieldByName('id_user').AsInteger;
        Result.login := QryUserSQLServer.FieldByName('login').AsString;
        Result.password := QryUserSQLServer.FieldByName('password').AsString;
      end
    else
      Result := nil;
  Except
    On E : Exception do
      ShowMessage(E.Message);
  End;
end;

end.
