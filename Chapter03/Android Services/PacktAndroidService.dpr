program PacktAndroidService;

uses
  System.Android.ServiceApplication,
  uPacktAndroidServiceDM in 'uPacktAndroidServiceDM.pas' {DM: TAndroidService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
