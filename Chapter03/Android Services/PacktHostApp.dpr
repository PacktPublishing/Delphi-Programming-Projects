program PacktHostApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmHostSerivce in 'uFrmHostSerivce.pas' {Form1},
  uPacktAndroidServiceDM in 'uPacktAndroidServiceDM.pas' {DM: TAndroidService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
