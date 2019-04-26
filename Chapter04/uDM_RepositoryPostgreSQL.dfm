object DM_RepositoryPostgreSQL: TDM_RepositoryPostgreSQL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 204
  Width = 215
  object FDConnPostgreSQL: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Password=postgres'
      'Database=packt'
      'Port=5433'
      'DriverID=PG')
    LoginPrompt = False
    Left = 88
    Top = 56
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 88
    Top = 112
  end
end
