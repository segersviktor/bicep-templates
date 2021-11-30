param projectName string
param environment string
param location string
param serverfarmPlanid string

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'app-${environment}-${projectName}'
  location: location
  properties: {
    serverFarmId: serverfarmPlanid
    siteConfig: {
      netFrameworkVersion: 'v6.0'
    }
  }
}
