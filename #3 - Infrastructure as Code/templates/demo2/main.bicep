targetScope = 'subscription'
param location string = 'westeurope'
param environment string = 'prod'
param crName string = 'crdemo2${environment}we' 
@allowed([
  'Basic'
  'Standard'
  'Premium'
])
param skuName string = 'Basic'
param crAnonymousPullEnabled bool = false


resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-demo2-we'
  location: location
}

module cr 'modules/containerReg.bicep' = {
  scope: resourceGroup
  name: 'crDeploy'
  params:{
    name: crName
    location: location
    skuName: skuName
    crAnonymousPullEnabled: crAnonymousPullEnabled
  }


}   

output crUri string = cr.outputs.crUri
