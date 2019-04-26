program appRemoteDesktop;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmCap6_Server in 'uFrmCap6_Server.pas' {FrmCap6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCap6, FrmCap6);
  Application.Run;
end.
