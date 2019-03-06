unit uService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  Vcl.ExtCtrls;

type
  TPacktBooks_Service = class(TService)
    Timer1: TTimer;
    procedure ServiceExecute(Sender: TService);
    procedure Timer1Timer(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

TNewServiceThread = class(TThread)
   public
     procedure Execute; override;
 end;

var
  PacktBooks_Service: TPacktBooks_Service;
  NewServiceThread: TNewServiceThread;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  PacktBooks_Service.Controller(CtrlCode);
end;

function TPacktBooks_Service.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TPacktBooks_Service.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
   NewServiceThread.Resume;
   Continued := True;
end;

procedure TPacktBooks_Service.ServiceExecute(Sender: TService);
begin
//  Timer1.Enabled := True;
  while not Terminated do
    ServiceThread.ProcessRequests(True);
//  Timer1.Enabled := False;
end;

procedure TPacktBooks_Service.ServicePause(Sender: TService;
  var Paused: Boolean);
begin
   NewServiceThread.Suspend;
   Paused := True;
end;

procedure TPacktBooks_Service.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
   NewServiceThread := TNewServiceThread.Create(False);
   Started := True;
end;

procedure TPacktBooks_Service.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
   NewServiceThread.Terminate;
   Stopped := True;
end;

procedure TPacktBooks_Service.Timer1Timer(Sender: TObject);
Const
  FileName = 'c:\Chapter3_WindowsServices.txt';
var
  F: TextFile;
begin
  AssignFile(f,FileName);

  if FileExists(FileName) then
    Append(f)
  else
    Rewrite(f);

  writeln(f,DateTimeToStr(Now));
  CloseFile(f);
end;

{ TServiceThread }

procedure TNewServiceThread.Execute;
const
  FileName = 'c:\Chapter3_WindowsServices_SafeThread.txt';
var
  F: TextFile;
begin
  while not Terminated do
   begin
     AssignFile(f,FileName);

      if FileExists(FileName) then
        Append(f)
      else
        Rewrite(f);

     writeln(f,DateTimeToStr(Now));
     CloseFile(f);
     Sleep(10000);
   end;
end;

end.
