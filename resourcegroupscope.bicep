/* PARAMETERS & VARIABLES */
@allowed([
  'westeurope'
])
param location string

@allowed([
  'tst'
  'acc'
  'prd'
])
param environment string

@minLength(3)
@maxLength(15)
param projectName string

module serverfarmPlan 'modules/serverfarm.bicep' = {
  name: 'appServicePlanDeploy'
  params: {
    location: location
    environment: environment
    projectName: projectName
  }
}

module appservice 'modules/appservice.bicep' = {
  name: 'appServiceDeploy'
  params: {
    serverfarmPlanid: serverfarmPlan.outputs.id
    location: location
    environment: environment
    projectName: projectName
  }
}

module appinsights_web './modules/appinsights.bicep' = {
  name: 'applicationInsightsDeploy'
  params: {
    location: location
    type: 'web'
    environment: environment
    projectName: projectName
  }
}

module sql 'modules/sql.bicep' = {
  name: 'sqlserverDeploy'
  params: {
    location: location
    environment: environment
    projectName: projectName
  }
}
