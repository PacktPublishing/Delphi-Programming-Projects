unit uiRepositories;

interface

uses
  uiRepoSystem;

 Type
  TpTypeRepo = ( trADOSQLServer, trUniPostgreSQL );

  IRepositories = interface
     function Repository : IRepoSystem;
 end;

  function Repositories: IRepositories;

implementation

uses
  uConfiguration,
  uDM_RepositorySQLServer,
  uDM_RepositoryPostgreSQL;

var
  mRepositories : IRepositories = nil;

function Repositories : IRepositories;
begin
   If assigned(result) then
       exit;

      case TpTypeRepo( configuration.TypeDataBase ) of
        trADOSQLServer :
        begin
          if not Assigned(mRepositories) then
            begin
              uDM_RepositorySQLServer.initialize;
              mRepositories := DM_RepositorySQLServer;
            end;
          Result := mRepositories;

        end;

        trUniPostgreSQL:
          begin
            if not Assigned(mRepositories) then
              begin
                uDM_RepositoryPostgreSQL.initialize;
                mRepositories := DM_RepositoryPostgreSQL;
              end;
            Result := mRepositories;
          end;
      end;

end;

end.
