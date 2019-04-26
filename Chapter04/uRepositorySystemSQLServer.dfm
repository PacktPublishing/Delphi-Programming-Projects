object DM_RepositorySystemSQLServer: TDM_RepositorySystemSQLServer
  OldCreateOrder = False
  Height = 216
  Width = 215
  object QryCustomerSQLServer: TFDQuery
    Connection = DM_RepositorySQLServer.FDConnSQLServer
    SQL.Strings = (
      
        'SELECT id_customer, customer_name, customer_status from customer' +
        's'
      'where id_customer =:id')
    Left = 80
    Top = 23
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QryUserSQLServer: TFDQuery
    Connection = DM_RepositorySQLServer.FDConnSQLServer
    SQL.Strings = (
      'select id_user, login, password from users'
      'where id_user = :id')
    Left = 80
    Top = 71
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object QryProductSQLServer: TFDQuery
    Connection = DM_RepositorySQLServer.FDConnSQLServer
    SQL.Strings = (
      'select id_product, code, descr, list_price,'
      ' tax, quantity from products'
      ' where id_product = :id')
    Left = 80
    Top = 127
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
