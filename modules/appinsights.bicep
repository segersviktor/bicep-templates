param projectName string
param environment string
param location string
param type string

resource applicationinsights 'Microsoft.Insights/components@2020-02-02-preview' = {
  name: 'appi-${environment}-${projectName}'
  location: location
  kind: type
  properties: {
    Application_Type: type
  }
}

output id string = applicationinsights.id
output name string = applicationinsights.name
output instrumentationKey string = applicationinsights.properties.InstrumentationKey
output connectionstring string = applicationinsights.properties.ConnectionString
output appId string = applicationinsights.properties.AppId
