param projectName string
param environment string
param location string
 

resource serverfarmPlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: 'plan-${environment}-${projectName}'
  location: location
  properties: {
    reserved: true
  }
  sku: {
    tier: 'Standard'
    name: 'S1'
  }
  kind: 'linux'
}


output id string = serverfarmPlan.id
output name string = serverfarmPlan.name
