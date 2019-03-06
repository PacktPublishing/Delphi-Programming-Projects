unit uRepositorySystemPostgreSQL;

interface

uses
  Dialogs, uDM_RepositoryPostgreSQL, uiRepoSystem, uCustomers, uUsers, uProducts,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM_RepositorySystemPostgreSQL = class(TDataModule, iRepoSystem)
    QryCustomerPostgreSQL: TFDQuery;
    QryUserPostgreSQL: TFDQuery;
    QryProductPostgreSQL: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function ReturnCustomer(id: Integer): TCustomer;
    function ReturnProduct(id: Integer): TProducts;
    function ReturnUser(id: Integer): TUser;
  end;

var
  DM_RepositorySystemPostgreSQL: TDM_RepositorySystemPostgreSQL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_RepositorySystemPostgreSQL }

function TDM_RepositorySystemPostgreSQL.ReturnCustomer(id: Integer): TCustomer;
begin
  Try
    QryCustomerPostgreSQL.Close;
    QryCustomerPostgreSQL.ParamByName('id').Value := id;
    QryCustomerPostgreSQL.Open;

    if not QryCustomerPostgreSQL.IsEmpty then
      begin
        Result := TCustomer.Create;
        Result.id := QryCustomerPostgreSQL.FieldByName('id_customer').AsInteger;
        Result.name := QryCustomerPostgreSQL.FieldByName('customer_name').AsString;
        Result.status := QryCustomerPostgreSQL.FieldByName('customer_status').AsInteger;
      end
    else
      Result := nil;
  Except
    On E : Exception do
      ShowMessage(E.Message);
  End;
end;

function TDM_RepositorySystemPostgreSQL.ReturnProduct(id: Integer): TProducts;
begin
  Try
    QryProductPostgreSQL.Close;
    QryProductPostgreSQL.ParamByName('id').Value := id;
    QryProductPostgreSQL.Open;

    if not QryProductPostgreSQL.IsEmpty then
      begin
        Result := TProducts.Create;
        Result.id := QryProductPostgreSQL.FieldByName('id_product').AsInteger;
        Result.code := QryProductPostgreSQL.FieldByName('code').AsString;
        Result.descr := QryProductPostgreSQL.FieldByName('descr').AsString;
        Result.list_price := QryProductPostgreSQL.FieldByName('list_price').AsFloat;
        Result.tax :=  QryProductPostgreSQL.FieldByName('tax').AsFloat;
        Result.quantity := QryProductPostgreSQL.FieldByName('quantity').AsFloat;
      end
    else
      Result := nil;
  Except
    On E : Exception do
      ShowMessage(E.Message);
  End;
end;

function TDM_RepositorySystemPostgreSQL.ReturnUser(id: Integer): TUser;
begin
   Try
    QryUserPostgreSQL.Close;
    QryUserPostgreSQL.ParamByName('id').Value := id;
    QryUserPostgreSQL.Open;

    if not QryUserPostgreSQL.IsEmpty then
      begin
        Result := TUser.Create;
        Result.id := QryUserPostgreSQL.FieldByName('id_user').AsInteger;
        Result.login := QryUserPostgreSQL.FieldByName('login').AsString;
        Result.password := QryUserPostgreSQL.FieldByName('password').AsString;
      end
    else
      Result := nil;
  Except
    On E : Exception do
      ShowMessage(E.Message);
  End;
end;

end.
