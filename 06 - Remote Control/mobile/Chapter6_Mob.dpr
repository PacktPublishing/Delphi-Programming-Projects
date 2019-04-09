program Chapter6_Mob;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmMobile in 'uFrmMobile.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
