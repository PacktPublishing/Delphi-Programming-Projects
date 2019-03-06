program MultiDatabase;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {Form1},
  uiRepositories in 'uiRepositories.pas',
  uiRepoSystem in 'uiRepoSystem.pas',
  uUsers in 'uUsers.pas',
  uProducts in 'uProducts.pas',
  uCustomers in 'uCustomers.pas',
  uDM_RepositorySQLServer in 'uDM_RepositorySQLServer.pas' {DM_RepositorySQLServer: TDataModule},
  uRepositorySystemSQLServer in 'uRepositorySystemSQLServer.pas' {DM_RepositorySystemSQLServer: TDataModule},
  uDM_RepositoryPostgreSQL in 'uDM_RepositoryPostgreSQL.pas' {DM_RepositoryPostgreSQL: TDataModule},
  uRepositorySystemPostgreSQL in 'uRepositorySystemPostgreSQL.pas' {DM_RepositorySystemPostgreSQL: TDataModule},
  uiConfig in 'uiConfig.pas',
  uConfiguration in 'uConfiguration.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
