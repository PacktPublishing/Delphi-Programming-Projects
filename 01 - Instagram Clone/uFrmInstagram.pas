unit uFrmInstagram;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions,
  FMX.MediaLibrary, FMX.Platform, System.Messaging;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    btnPhoto: TButton;
    Button2: TButton;
    ToolBar2: TToolBar;
    Button1: TButton;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    SpeedButton1: TSpeedButton;
    Path1: TPath;
    ImgInsta: TImage;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    Button3: TButton;
    ShowShareSheetAction1: TShowShareSheetAction;
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
    procedure Button3Click(Sender: TObject);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoDidFinish(Image: TBitmap);
    procedure DoMessageListener(const Sender: TObject; const M: TMessage);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}

{ TForm1 }

procedure TForm1.Button3Click(Sender: TObject);
var
  Service: IFMXCameraService;
  Params: TParamsPhotoQuery;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXCameraService,
    Service) then
  begin
    Params.Editable := True;
    // Specifies whether to save a picture to device Photo Library
    Params.NeedSaveToAlbum := True;
    Params.RequiredResolution := TSize.Create(640, 640);
    Params.OnDidFinishTaking := DoDidFinish;
    Service.TakePhoto(Button3, Params);
  end
  else
    ShowMessage('This device does not support the camera service');
end;

procedure TForm1.DoDidFinish(Image: TBitmap);
begin
  ImgInsta.Bitmap.Assign(Image);
end;

procedure TForm1.DoMessageListener(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageDidFinishTakingImageFromLibrary then
    ImgInsta.Bitmap.Assign(TMessageDidFinishTakingImageFromLibrary(M).Value);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TMessageManager.DefaultManager.SubscribeToMessage(
    TMessageDidFinishTakingImageFromLibrary, DoMessageListener);
end;

procedure TForm1.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  ShowShareSheetAction1.Bitmap.Assign(ImgInsta.Bitmap);
end;

procedure TForm1.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  DoDidFinish(Image);
end;

procedure TForm1.TakePhotoFromLibraryAction1DidFinishTaking(Image: TBitmap);
begin
  DoDidFinish(Image);
end;

end.
