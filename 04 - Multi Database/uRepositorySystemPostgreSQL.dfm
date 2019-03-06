object DM_RepositorySystemPostgreSQL: TDM_RepositorySystemPostgreSQL
  OldCreateOrder = False
  Height = 190
  Width = 215
  object QryCustomerPostgreSQL: TFDQuery
    Connection = DM_RepositoryPostgreSQL.FDConnPostgreSQL
    SQL.Strings = (
      
        'SELECT id_customer, customer_name, customer_status from customer' +
        's'
      'where id_customer =:id')
    Left = 80
    Top = 23
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QryUserPostgreSQL: TFDQuery
    Connection = DM_RepositoryPostgreSQL.FDConnPostgreSQL
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
  object QryProductPostgreSQL: TFDQuery
    Connection = DM_RepositoryPostgreSQL.FDConnPostgreSQL
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
