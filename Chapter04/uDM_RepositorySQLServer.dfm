object DM_RepositorySQLServer: TDM_RepositorySQLServer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 201
  Width = 289
  object FDConnSQLServer: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'User_Name=sa'
      'Password=nwsoftware'
      'Database=PACKT'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 88
    Top = 56
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 88
    Top = 104
  end
end
