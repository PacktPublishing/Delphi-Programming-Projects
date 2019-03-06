unit uPacktAndroidServiceDM;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Android.Service,
  AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os, System.Notification, System.Threading,
  System.DateUtils;

type
  TDM = class(TAndroidService)
    NotificationCenter1: TNotificationCenter;
    function AndroidServiceStartCommand(const Sender: TObject;
      const Intent: JIntent; Flags, StartId: Integer): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
    T : ITask;
    procedure LaunchNotification(Name, Title, Body : String);
  end;

var
  DM: TDM;

implementation

uses Androidapi.JNI.App;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

function TDM.AndroidServiceStartCommand(const Sender: TObject;
  const Intent: JIntent; Flags, StartId: Integer): Integer;
begin
  Result := TJService.JavaClass.START_STICKY;
  T := TTask.Run( procedure
   begin
    while True do
      sleep(10);
      LaunchNotification('Packt Delphi Book', 'Delphi Rocks',
        'This is Chapter 3!');
      exit;
   end
  )
end;

procedure TDM.LaunchNotification(Name, Title, Body: String);
var
  Notify : TNotification;
begin
  Notify := NotificationCenter1.CreateNotification;
  Try
    Notify.Name := Name;
    Notify.Title := Title;
    Notify.AlertBody := Body;
    Notify.FireDate := IncSecond(Now,1);
    NotificationCenter1.ScheduleNotification(Notify);
  Finally
    Notify.Free;
  End;
end;

end.
