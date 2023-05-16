param stName string
param location string


resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: stName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}


// param
// var
// resource 
// module
// output
