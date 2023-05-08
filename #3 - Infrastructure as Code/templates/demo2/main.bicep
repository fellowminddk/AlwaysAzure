targetScope = 'subscription'
param location string = 'westeurope'
param environment string = 'prod'
param crName string = 'crsharedmodules${environment}' 
param stName string = 'stsharedmodules${environment}' 
@allowed([
  'Basic'
  'Standard'
  'Premium'
])
param skuName string = 'Basic'
param crAnonymousPullEnabled bool = false


resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-sharedmodule-we'
  location: location
}

module cr 'modules/containerReg.bicep' = {
  scope: resourceGroup
  name: 'Deploy-cr'
  params:{
    name: crName
    location: location
    skuName: skuName
    crAnonymousPullEnabled: crAnonymousPullEnabled
  }


}   

// module storage 'modules/storage.bicep' = {
//   scope: resourceGroup
//   name: 'Deploy-storage'
//   params: {
//     location: location
//     name: stName
//   }
// }

output crUri string = cr.outputs.crUri
