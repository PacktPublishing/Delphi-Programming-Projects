unit uFrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TWebFormRedirectEvent = procedure(const AURL : string; var DoCloseWebView: boolean) of object;

type
  TFrmLogin = class(TForm)
    Rectangle1: TRectangle;
    btnCancel: TButton;
    WebBrowser1: TWebBrowser;
    procedure WebBrowser1DidFinishLoad(ASender: TObject);
  private
    FOnBeforeRedirect: TWebFormRedirectEvent;
    { Private declarations }
  public
    { Public declarations }
        property OnBeforeRedirect: TWebFormRedirectEvent read FOnBeforeRedirect write FOnBeforeRedirect;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses
  Unit1;

procedure Facebook_AccessTokenRedirect(const AURL: string; var DoCloseWebView: boolean);
var
      LATPos: integer;
      LToken: string;
begin
        try
                LATPos := Pos('access_token=', AURL);

                if (LATPos > 0) then
                begin
                        LToken := Copy(AURL, LATPos + 13, Length(AURL));

                        if (Pos('&', LToken) > 0) then
                        begin
                                LToken := Copy(LToken, 1, Pos('&', LToken) - 1);
                        end;

                        Form1.FAccessToken := LToken;

                        if (LToken <> '') then
                        begin
                                DoCloseWebView := True;
                        end;
                end
                else
                begin
                        LATPos := Pos('api_key=', AURL);

                        if LATPos <= 0 then
                        begin
                                LATPos := Pos('access_denied', AURL);

                                if (LATPos > 0) then
                                begin
                                        // Denied, Not Allow
                                        Form1.FAccessToken := '';
                                        DoCloseWebView := True;
                                end;
                        end;
                end;
      except
        on E: Exception do
          ShowMessage(E.Message);
      END;
    end;

procedure TFrmLogin.WebBrowser1DidFinishLoad(ASender: TObject);
var
        CloseWebView : boolean;
        url : string;
begin
        url := TWebBrowser(ASender).URL;
        CloseWebView := false;

        if url <> '' then
                Facebook_AccessTokenRedirect(url, CloseWebView);

        if CloseWebView then
        begin
                TWebBrowser(ASender).Stop;
                TWebBrowser(ASender).URL := '';
                FrmLogin.close;
                ModalResult := mrok;
        end;
end;

end.
