param location string 
param name string

resource st 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: name
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

output stName string = st.name
