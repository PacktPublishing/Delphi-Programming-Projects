// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://currencyconverter.kowabunga.net/converter.asmx?WSDL
//  >Import : http://currencyconverter.kowabunga.net/converter.asmx?WSDL>0
// Encoding : utf-8
// Version  : 1.0
// (23/04/2019 04:36:29 - - $Rev: 93209 $)
// ************************************************************************ //

unit Converter;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:schema          - "http://www.w3.org/2001/XMLSchema"[GblElm]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]

  DataSet              = class;                 { "http://tempuri.org/"[GblElm] }
  GetCurrencyRatesResult = class;               { "http://tempuri.org/"[Cplx] }
  ds                   = class;                 { "http://tempuri.org/"[Cplx] }
  ds2                  = class;                 { "http://tempuri.org/"[Cplx] }

  ArrayOfString2 = array of string;             { "http://tempuri.org/"[GblCplx] }
  ArrayOfString   =  type ArrayOfString2;      { "http://tempuri.org/"[GblElm] }
  string_         =  type string;      { "http://tempuri.org/"[GblElm] }
  decimal         = class(TXSDecimal) end;      { "http://tempuri.org/"[GblElm] }


  // ************************************************************************ //
  // XML       : DataSet, global, <element>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  DataSet = class(TRemotable)
  private
    Fschema: TXMLData;
  public
    destructor Destroy; override;
  published
    property schema: TXMLData  Index (IS_REF) read Fschema write Fschema;
  end;



  // ************************************************************************ //
  // XML       : GetCurrencyRatesResult, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  GetCurrencyRatesResult = class(TRemotable)
  private
    Fschema: TXMLData;
  public
    destructor Destroy; override;
  published
    property schema: TXMLData  Index (IS_REF) read Fschema write Fschema;
  end;

  dateTime        = class(TXSDateTime) end;      { "http://tempuri.org/"[GblElm] }


  // ************************************************************************ //
  // XML       : ds, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ds = class(TRemotable)
  private
    Fschema: TXMLData;
  public
    destructor Destroy; override;
  published
    property schema: TXMLData  Index (IS_REF) read Fschema write Fschema;
  end;



  // ************************************************************************ //
  // XML       : ds, <complexType>
  // Namespace : http://tempuri.org/
  // ************************************************************************ //
  ds2 = class(TRemotable)
  private
    Fschema: TXMLData;
  public
    destructor Destroy; override;
  published
    property schema: TXMLData  Index (IS_REF) read Fschema write Fschema;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : ConverterSoap
  // service   : Converter
  // port      : ConverterSoap
  // URL       : http://currencyconverter.kowabunga.net/converter.asmx
  // ************************************************************************ //
  ConverterSoap = interface(IInvokable)
  ['{1256788B-9169-903F-2E9F-57949AD40A73}']
    function  GetCurrencies: ArrayOfString2; stdcall;
    function  GetCurrencyRate(const Currency: string; const RateDate: TXSDateTime): TXSDecimal; stdcall;
    function  GetCurrencyRates(const RateDate: TXSDateTime): GetCurrencyRatesResult; stdcall;
    function  GetConversionRate(const CurrencyFrom: string; const CurrencyTo: string; const RateDate: TXSDateTime): TXSDecimal; stdcall;
    function  GetConversionAmount(const CurrencyFrom: string; const CurrencyTo: string; const RateDate: TXSDateTime; const Amount: TXSDecimal): TXSDecimal; stdcall;
    function  GetCultureInfo(const Currency: string): string; stdcall;
    function  ConvertDataTableColumn(const ds: ds2; const TableIndex: Integer; const ColumnName: string; const FromCurrency: string; const ToCurrency: string): ds; stdcall;
    function  GetLastUpdateDate: TXSDateTime; stdcall;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // style     : ????
  // use       : ????
  // binding   : ConverterHttpGet
  // service   : Converter
  // port      : ConverterHttpGet
  // ************************************************************************ //
  ConverterHttpGet = interface(IInvokable)
  ['{3DD3AC09-52BE-383F-4F1D-471A9D542DE6}']
    function  GetCurrencies: ArrayOfString; stdcall;
    function  GetCurrencyRate(const Currency: string; const RateDate: string): decimal; stdcall;
    function  GetCurrencyRates(const RateDate: string): DataSet; stdcall;
    function  GetConversionRate(const CurrencyFrom: string; const CurrencyTo: string; const RateDate: string): decimal; stdcall;
    function  GetConversionAmount(const CurrencyFrom: string; const CurrencyTo: string; const RateDate: string; const Amount: string): decimal; stdcall;
    function  GetCultureInfo(const Currency: string): string_; stdcall;
    function  GetLastUpdateDate: dateTime; stdcall;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // style     : ????
  // use       : ????
  // binding   : ConverterHttpPost
  // service   : Converter
  // port      : ConverterHttpPost
  // ************************************************************************ //
  ConverterHttpPost = interface(IInvokable)
  ['{6D929EBD-1165-068F-4CE4-B9CFC65EB841}']
    function  GetCurrencies: ArrayOfString; stdcall;
    function  GetCurrencyRate(const Currency: string; const RateDate: string): decimal; stdcall;
    function  GetCurrencyRates(const RateDate: string): DataSet; stdcall;
    function  GetConversionRate(const CurrencyFrom: string; const CurrencyTo: string; const RateDate: string): decimal; stdcall;
    function  GetConversionAmount(const CurrencyFrom: string; const CurrencyTo: string; const RateDate: string; const Amount: string): decimal; stdcall;
    function  GetCultureInfo(const Currency: string): string_; stdcall;
    function  GetLastUpdateDate: dateTime; stdcall;
  end;

function GetConverterSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ConverterSoap;
function GetConverterHttpGet(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ConverterHttpGet;
function GetConverterHttpPost(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ConverterHttpPost;


implementation
  uses System.SysUtils;

function GetConverterSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ConverterSoap;
const
  defWSDL = 'http://currencyconverter.kowabunga.net/converter.asmx?WSDL';
  defURL  = 'http://currencyconverter.kowabunga.net/converter.asmx';
  defSvc  = 'Converter';
  defPrt  = 'ConverterSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ConverterSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


function GetConverterHttpGet(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ConverterHttpGet;
const
  defWSDL = 'http://currencyconverter.kowabunga.net/converter.asmx?WSDL';
  defURL  = '';
  defSvc  = 'Converter';
  defPrt  = 'ConverterHttpGet';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ConverterHttpGet);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


function GetConverterHttpPost(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ConverterHttpPost;
const
  defWSDL = 'http://currencyconverter.kowabunga.net/converter.asmx?WSDL';
  defURL  = '';
  defSvc  = 'Converter';
  defPrt  = 'ConverterHttpPost';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ConverterHttpPost);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor DataSet.Destroy;
begin
  System.SysUtils.FreeAndNil(Fschema);
  inherited Destroy;
end;

destructor GetCurrencyRatesResult.Destroy;
begin
  System.SysUtils.FreeAndNil(Fschema);
  inherited Destroy;
end;

destructor ds.Destroy;
begin
  System.SysUtils.FreeAndNil(Fschema);
  inherited Destroy;
end;

destructor ds2.Destroy;
begin
  System.SysUtils.FreeAndNil(Fschema);
  inherited Destroy;
end;

initialization
  { ConverterSoap }
  InvRegistry.RegisterInterface(TypeInfo(ConverterSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ConverterSoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ConverterSoap), ioDocument);
  { ConverterSoap.GetCurrencies }
  InvRegistry.RegisterMethodInfo(TypeInfo(ConverterSoap), 'GetCurrencies', '',
                                 '[ReturnName="GetCurrenciesResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(ConverterSoap), 'GetCurrencies', 'GetCurrenciesResult', '',
                                '[ArrayItemName="string"]');
  { ConverterSoap.GetCurrencyRate }
  InvRegistry.RegisterMethodInfo(TypeInfo(ConverterSoap), 'GetCurrencyRate', '',
                                 '[ReturnName="GetCurrencyRateResult"]');
  { ConverterSoap.GetCurrencyRates }
  InvRegistry.RegisterMethodInfo(TypeInfo(ConverterSoap), 'GetCurrencyRates', '',
                                 '[ReturnName="GetCurrencyRatesResult"]', IS_OPTN);
  { ConverterSoap.GetConversionRate }
  InvRegistry.RegisterMethodInfo(TypeInfo(ConverterSoap), 'GetConversionRate', '',
                                 '[ReturnName="GetConversionRateResult"]');
  { ConverterSoap.GetConversionAmount }
  InvRegistry.RegisterMethodInfo(TypeInfo(ConverterSoap), 'GetConversionAmount', '',
                                 '[ReturnName="GetConversionAmountResult"]');
  { ConverterSoap.GetCultureInfo }
  InvRegistry.RegisterMethodInfo(TypeInfo(ConverterSoap), 'GetCultureInfo', '',
                                 '[ReturnName="GetCultureInfoResult"]', IS_OPTN);
  { ConverterSoap.ConvertDataTableColumn }
  InvRegistry.RegisterMethodInfo(TypeInfo(ConverterSoap), 'ConvertDataTableColumn', '',
                                 '[ReturnName="ds"]', IS_OPTN);
  { ConverterSoap.GetLastUpdateDate }
  InvRegistry.RegisterMethodInfo(TypeInfo(ConverterSoap), 'GetLastUpdateDate', '',
                                 '[ReturnName="GetLastUpdateDateResult"]');
  { ConverterHttpGet }
  InvRegistry.RegisterInterface(TypeInfo(ConverterHttpGet), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ConverterHttpGet), '');
  { ConverterHttpPost }
  InvRegistry.RegisterInterface(TypeInfo(ConverterHttpPost), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ConverterHttpPost), '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfString2), 'http://tempuri.org/', 'ArrayOfString2', 'ArrayOfString');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfString), 'http://tempuri.org/', 'ArrayOfString');
  RemClassRegistry.RegisterXSInfo(TypeInfo(string_), 'http://tempuri.org/', 'string_', 'string');
  RemClassRegistry.RegisterXSInfo(TypeInfo(decimal), 'http://tempuri.org/', 'decimal');
  RemClassRegistry.RegisterXSClass(DataSet, 'http://tempuri.org/', 'DataSet');
  RemClassRegistry.RegisterXSClass(GetCurrencyRatesResult, 'http://tempuri.org/', 'GetCurrencyRatesResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(dateTime), 'http://tempuri.org/', 'dateTime');
  RemClassRegistry.RegisterXSClass(ds, 'http://tempuri.org/', 'ds');
  RemClassRegistry.RegisterXSClass(ds2, 'http://tempuri.org/', 'ds2', 'ds');

end.