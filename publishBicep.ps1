# # publishes the bicep module to container Registry
$uri = $deployment.Outputs.crUri.Value
$target = "br:$uri/bicep/modules/functionapp:v1"
write-host $target
Publish-AzBicepModule -FilePath "$PSScriptRoot/$TemplateFileName" -Target $target