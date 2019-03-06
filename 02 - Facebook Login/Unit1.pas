unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, REST.Client,
  REST.Authenticator.OAuth, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    OAuth2Authenticator1: TOAuth2Authenticator;
    edtName: TEdit;
    edtEmail: TEdit;
    btnLogin: TButton;
    circle_photo: TCircle;
    procedure RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }

    function LoadPhoto(url : string): TMemoryStream;
  public
    { Public declarations }
    FAccessToken : String;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  REST.Utils, System.JSON, Web.HTTPApp,System.Net.HttpClient,IdHTTP,
  uFrmLogin;

procedure TForm1.btnLoginClick(Sender: TObject);
var
        app_id, LURL : string;
begin
        try
                FAccessToken := '';
                app_id := '1000017776848929'; // Your App ID here...

                LURL := 'https://www.facebook.com/dialog/oauth'
                        + '?client_id=' + URIEncode(app_id)
                        + '&response_type=token'
                        + '&scope=' + URIEncode('public_profile,email')
                        + '&redirect_uri=' + URIEncode('https://www.facebook.com/connect/login_success.html');


                // Abre tela de login do facebook...
                try
                        FrmLogin := TFrmLogin.Create(nil);
                        FrmLogin.WebBrowser1.Navigate(LURL);
                        FrmLogin.ShowModal(
                                        procedure(ModalResult: TModalResult)
                                        begin
                                                if FAccessToken <> '' then
                                                begin
                                                        RESTRequest1.ResetToDefaults;
                                                        RESTClient1.ResetToDefaults;
                                                        RESTResponse1.ResetToDefaults;

                                                        RESTClient1.BaseURL := 'https://graph.facebook.com';
                                                        RESTClient1.Authenticator := OAuth2Authenticator1;
                                                        RESTRequest1.Resource := 'me?fields=first_name,last_name,email,picture.height(150)';
                                                        OAuth2Authenticator1.AccessToken := FAccessToken;

                                                        RESTRequest1.Execute;
                                                end;
                                        end);
                finally

                end;


        except on e:exception do
                showmessage(e.Message);
        end;
end;

function TForm1.LoadPhoto(url : string): TMemoryStream;
var
        MS : TMemoryStream;
        photo: TBitmap;
        http : THTTPClient;
begin
        MS := TMemoryStream.Create;
        http := THTTPClient.Create;

        photo := TBitmap.Create;
        try
                try
                        http.Get(url, MS);

                except on e: EIdHTTPProtocolException do
                begin
                        if e.ErrorCode = 404 then
                        begin
                                // url not found
                                showmessage('Not found');
                        end
                        else
                        begin
                                // error.
                                showmessage('Error...');
                        end;
                end;
                end;

                MS.Position := 0;
                Result := MS;
        finally
                photo.Free;
        end;
end;

procedure TForm1.RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
var
        LJsonObj  : TJSONObject;
        LElements: TJSONValue;

        msg, url_photo, name, email, user_id : string;

        MS: TMemoryStream;
begin
        try
                msg := '';
                FAccessToken := '';


                // Valid JSON
                if Assigned(RESTResponse1.JSONValue) then
                        msg := RESTResponse1.JSONValue.ToString;


                // Extract JSON fields
                LJsonObj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(msg), 0) as TJSONObject;

                try
                        user_id := HTMLDecode(StringReplace(TJSONObject(LJsonObj).Get('id').JsonValue.ToString, '"', '', [rfReplaceAll]));
                except
                end;

                try
                        email := StringReplace(TJSONObject(LJsonObj).Get('email').JsonValue.ToString, '"', '', [rfReplaceAll]);
                except
                end;

                try
                        // First Name
                        name := StringReplace(TJSONObject(LJsonObj).Get('first_name').JsonValue.ToString, '"', '', [rfReplaceAll]);
                except
                end;

                try
                        // Last Name
                        name := name + ' ' + StringReplace(TJSONObject(LJsonObj).Get('last_name').JsonValue.ToString, '"', '', [rfReplaceAll]);
                except
                end;

                try
                        LElements := TJSONObject(TJSONObject(LJsonObj).Get('picture').JsonValue).Get('data').JsonValue;
                        url_photo := StringReplace(TJSONObject(LElements).Get('url').JsonValue.ToString, '"', '', [rfReplaceAll]);
                except
                end;




                // Download Photo
                try
                        MS := TMemoryStream.Create;
                        MS := LoadPhoto(url_photo);

                        circle_photo.Fill.Bitmap.Bitmap.LoadFromStream(MS);

                except
                        showmessage('Error');
                end;

                edtName.Text := name;
                edtEmail.Text := email;

        except

        end;
end;


end.
