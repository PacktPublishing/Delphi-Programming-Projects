unit uConverterRADServer;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, Soap.InvokeRegistry,
  Soap.Rio, Soap.SOAPHTTPClient, Converter;

type
  [ResourceName('Currency')]
  TCurrencyResource1 = class(TDataModule)
    HTTPRIO1: THTTPRIO;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FwsConverter: ConverterSoap;
    procedure SetwsConverter(const Value: ConverterSoap);
  public
    property  wsConverter : ConverterSoap read FwsConverter write SetwsConverter;
  published
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  Xml.xmldom, Xml.omnixmldom, XSBuiltIns;

procedure TCurrencyResource1.DataModuleCreate(Sender: TObject);
begin
  wsConverter := HTTPRIO1 as ConverterSoap;
end;

procedure TCurrencyResource1.DataModuleDestroy(Sender: TObject);
begin
  wsConverter := nil;
end;

procedure TCurrencyResource1.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  // Sample code
   DefaultDOMVendor := sOmniXmlVendor;
   AResponse.Body.SetValue(TJSONString.Create( DateToStr(wsConverter.GetLastUpdateDate.AsDateTime)), True) ;
end;

procedure TCurrencyResource1.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
  Amount : TXSDecimal;
begin
  if AContext.User = nil then
    EEMSHTTPError.RaiseUnauthorized('', 'User Required');
  if not AContext.User.Groups.Contains('testgroup') then
    EEMSHTTPError.RaiseForbidden('','Test Group Required');

  DefaultDOMVendor := sOmniXmlVendor;
  LItem := ARequest.Params.Values['item'];
  Amount := TXSDecimal.Create;
  Amount.DecimalString := LItem;

  AResponse.Body.SetValue(TJSONString.Create(
    wsConverter.GetConversionAmount('USD','BRL',DateTimeToXSDateTime(Date-2),Amount).DecimalString ), True)
end;

procedure TCurrencyResource1.SetwsConverter(const Value: ConverterSoap);
begin
  FwsConverter := Value;
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TCurrencyResource1));
end;

initialization
  Register;
end.


