unit uFrmCap6_Server;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile, FMX.Objects,
  System.Actions, FMX.ActnList, Winapi.ShellAPI, Winapi.Windows,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFrmCap6 = class(TForm)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    Image1: TImage;
    ActionList1: TActionList;
    Action1: TAction;
    procedure TetheringManager1RequestManagerPassword(const Sender: TObject;
      const ARemoteIdentifier: string; var Password: string);
    procedure TetheringAppProfile1Resources0ResourceReceived(
      const Sender: TObject; const AResource: TRemoteResource);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCap6: TFrmCap6;

implementation

{$R *.fmx}

uses
  System.Tether.NetworkAdapter;

procedure TFrmCap6.Action1Execute(Sender: TObject);
begin
  ShellExecute(0,'open', PChar('C:\Windows\System32\calc.exe'), '',
    nil, SW_ShowNormal)
end;

procedure TFrmCap6.TetheringAppProfile1Resources0ResourceReceived(
  const Sender: TObject; const AResource: TRemoteResource);
begin
  TThread.Synchronize(nil, procedure
  var
   LSize : Int64;
   begin
    Try
      LSize := AResource.Value.AsStream.Size;
      AResource.Value.AsStream.Position := 0;
      Image1.Bitmap.LoadFromStream(AResource.Value.AsStream);
      image1.Repaint;
    Except

    End;
   end);
end;

procedure TFrmCap6.TetheringManager1RequestManagerPassword(
  const Sender: TObject; const ARemoteIdentifier: string; var Password: string);
begin
  Password := 'delphi';
end;

end.
