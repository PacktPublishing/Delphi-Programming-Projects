unit uDM_RepositorySQLServer;

interface

uses
  Forms, Dialogs, uiRepositories, uiRepoSystem,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Phys.ODBCBase, Data.DB,
  FireDAC.Comp.Client;

type
  TDM_RepositorySQLServer = class(TDataModule, IRepositories)
    FDConnSQLServer: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function Repository: IRepoSystem;
    { Public declarations }
  end;

var
  DM_RepositorySQLServer: TDM_RepositorySQLServer;

  procedure initialize;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  uRepositorySystemSQLServer;

var
  mRepository : IRepoSystem;

procedure initialize;
begin
  If Assigned( DM_RepositorySQLServer ) then
      exit;
  Application.CreateForm(TDM_RepositorySQLServer, DM_RepositorySQLServer);
end;

procedure TDM_RepositorySQLServer.DataModuleCreate(Sender: TObject);
begin
  Try
    FDConnSQLServer.Connected := False;
    FDConnSQLServer.Connected := True;
  Except
    On E : Exception do
      ShowMessage('Error Connect SQL Server : ' + E.Message)
  End;
end;

function TDM_RepositorySQLServer.Repository: IRepoSystem;
begin
  if not assigned(mRepository) then
    mRepository := TDM_RepositorySystemSQLServer.Create(Self);
  Result := mRepository;
end;

end.
