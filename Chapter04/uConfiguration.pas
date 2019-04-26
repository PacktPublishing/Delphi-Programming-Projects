unit uConfiguration;

interface

uses
  uiConfig;

Type
  TConfig = class(TInterfacedObject, IConfig)
  private
    fTypeDataBase : Integer;
  public
    function getTypeDataBase: Integer;
    procedure setTypeDataBase(const Value: Integer);
    Constructor Create;
  end;

function configuration : IConfig;


implementation

uses
  SysUtils, IniFiles;

var
  mConfig : IConfig = Nil;
  Ini : TIniFile;

function configuration : IConfig;
begin
  if not Assigned( mConfig )
    then
      mConfig := TConfig.Create;
    Result := mConfig;
end;

{ TConfig }

constructor TConfig.Create;
begin
  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Packt.ini');
end;

function TConfig.getTypeDataBase: Integer;
begin
  Result := Ini.ReadInteger('PACKT','DATABASE',0);
end;

procedure TConfig.setTypeDataBase(const Value: Integer);
begin
  Ini.WriteInteger('PACKT','DATABASE',Value);
  fTypeDataBase := Value;
end;

end.
