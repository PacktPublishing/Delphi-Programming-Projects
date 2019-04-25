object CurrencyResource1: TCurrencyResource1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 'http://currencyconverter.kowabunga.net/converter.asmx?WSDL'
    Service = 'Converter'
    Port = 'ConverterSoap'
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 88
    Top = 64
  end
end
