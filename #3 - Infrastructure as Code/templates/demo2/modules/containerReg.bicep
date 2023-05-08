param location string
param name string

param crAnonymousPullEnabled bool

param skuName string
resource containerRegistry 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: name
  location: location
  sku: {
    name: skuName
  }
  properties: {
    adminUserEnabled: true
    anonymousPullEnabled: crAnonymousPullEnabled
  }
}

output crUri string = containerRegistry.properties.loginServer
