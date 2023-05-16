# # publishes the bicep module to container Registry
$uri = 'crdemo2prodwe.azurecr.io' # URI to the published Container registry
$target = "br:$uri/bicep/modules/functionapp:v1" # Module path
write-host $target
Publish-AzBicepModule -FilePath '#3 - Infrastructure as Code\templates\demo3\main.bicep' -Target $target