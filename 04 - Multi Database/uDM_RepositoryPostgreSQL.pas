unit uDM_RepositoryPostgreSQL;

interface

uses
  Forms, Dialogs, uiRepositories, uiRepoSystem,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TDM_RepositoryPostgreSQL = class(TDataModule, IRepositories)
    FDConnPostgreSQL: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Repository: IRepoSystem;
  end;

var
  DM_RepositoryPostgreSQL: TDM_RepositoryPostgreSQL;

  procedure initialize; //declaration

implementation

uses
  uRepositorySystemPostgreSQL;

{%CLASSGROUP 'Vcl.Controls.TControl'}

var
  mRepository : IRepoSystem;

procedure initialize;
begin
  If Assigned( DM_RepositoryPostgreSQL ) then
      exit;
  Application.CreateForm(TDM_RepositoryPostgreSQL, DM_RepositoryPostgreSQL);
end;


{$R *.dfm}

procedure TDM_RepositoryPostgreSQL.DataModuleCreate(Sender: TObject);
begin
  Try
    FDConnPostgreSQL.Connected := False;
    FDConnPostgreSQL.Connected := True;
  Except
    On E : Exception do
      ShowMessage('Error Connect PostgreSQL : ' + E.Message)
  End;
end;

function TDM_RepositoryPostgreSQL.Repository: IRepoSystem;
begin
  if not assigned(mRepository) then
    mRepository := TDM_RepositorySystemPostgreSQL.Create(Self);
  Result := mRepository;
end;

end.
