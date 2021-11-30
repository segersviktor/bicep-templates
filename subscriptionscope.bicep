targetScope = 'subscription'

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
 

var tags = {
  Environment: environment
 }

/* RESOURCE GROUPS */
resource rg_resources 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${projectName}-${environment}-01'
  location: location
  tags: tags
}


module resourcegroupscope 'resourcegroupscope.bicep' = {
  name:'resourcegroupscope_deploy'
  scope: rg_resources
  params:{
   environment: environment
   location: location
   projectName: projectName
  }
}
