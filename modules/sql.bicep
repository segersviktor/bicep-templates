param projectName string
param environment string
param location string
 

resource sqlserver 'Microsoft.Sql/servers@2021-05-01-preview' = {
  name: 'sql-${environment}-${projectName}'
  location: location
  properties: {
    administratorLogin: 'your-login'
    administratorLoginPassword: '!mydbpwd123' 
  }
}



resource sqldb 'Microsoft.Sql/servers/databases@2017-10-01-preview' = {
  name: 'sqldb-${environment}-${projectName}'
  location: location
  sku: {
    capacity: 5
    name: 'Basic'
    tier: 'Basic'
  }
  parent: sqlserver
}
