targetScope = 'subscription'
param location string = 'westeurope'
param environment string = 'prod'
param appiName string = 'appi-demo3-${environment}-we' 
param stName string = 'stdemo3${environment}we' 
param aspName string = 'asp-demo3-${environment}-we'
param appName string = 'func-demo3-${environment}-we'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-demo3-we'
  location: location
}

module st 'modules/storage.bicep' = {
  scope: resourceGroup
  name: 'stgDeploy'
  params: {
    location: location
    name: stName
  }
}

module appi 'modules/appInsights.bicep' = {
  scope: resourceGroup
  name: 'appiDeploy'
  params: {
    location: location
    name: appiName
  }
}

module asp 'modules/appServicePlan.bicep' = {
  scope: resourceGroup
  name: 'aspDeploy'
  params: {
    location: location
    name: aspName
  }
}

module func 'modules/func.bicep' = {
  scope: resourceGroup
  name: 'funcDeploy'
  params: {
    appPlanId: asp.outputs.aspId
    InstrumentationKey: appi.outputs.instrumentationKey
    location: location
    name: appName
    storageAccountName: st.outputs.stName
  }
}
