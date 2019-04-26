unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnShowUser: TButton;
    btnShowCustomer: TButton;
    btnShowProduct: TButton;
    procedure btnShowUserClick(Sender: TObject);
    procedure btnShowCustomerClick(Sender: TObject);
    procedure btnShowProductClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uiRepositories, uUsers, uProducts, uCustomers;

{$R *.dfm}

procedure TForm1.btnShowProductClick(Sender: TObject);
var
  pProduct : TProducts;
begin
  pProduct := Repositories.Repository.ReturnProduct(1);
  ShowMessage(pProduct.descr);
end;

procedure TForm1.btnShowUserClick(Sender: TObject);
var
  pUser : TUser;
begin
  pUser := Repositories.Repository.ReturnUser(1);
  ShowMessage(pUser.login);
end;

procedure TForm1.btnShowCustomerClick(Sender: TObject);
var
  pCustomer : TCustomer;
begin
  pCustomer := Repositories.Repository.ReturnCustomer(1);
  ShowMessage(pCustomer.name);
end;

end.
