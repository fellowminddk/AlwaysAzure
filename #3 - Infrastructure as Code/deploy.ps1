# Deploys the template file in this folder to Azure.
[CmdletBinding()]
param (
    # Azure Template file to use for deployment
    # Must be in the same folder as this script
    [Parameter()][string]$TemplateFileName = "./templates/demo2/main.bicep",

    # Azure Template Parameter to use for deployment
    # Must be in the same folder as this script
    #[Parameter(Mandatory)][string]$TemplateParameterFileName,

    # SubscriptionId to deploy template to
    [Parameter()][string]$SubscriptionId = '075b3bc1-6caf-4b0f-8592-b1dec51f698c',

    # Tenant to deploy to.
    [Parameter()][string]$TenantId = '75f90aca-161f-4cc7-b948-aa99ea67cfcc', 

    # The location to store deployment data
    # *Not* used for the location of the deployed azure resources
    [Parameter()][string]$DeploymentRegion = 'WestEurope' 
)

# Set Azure Context
Set-AzContext -Tenant $TenantId -Subscription $SubscriptionId -ErrorAction "Stop"
# returns all locks at, above, or below the scope and deletes all
Get-AzResourceLock | Remove-AzResourceLock -Force

$splat = @{
    Name                  = "deployment-{0}" -f (Get-Date).Ticks
    Location              = $DeploymentRegion
    TemplateFile          = "$PSScriptRoot/$TemplateFileName"
    #TemplateParameterFile = "$PSScriptRoot/$TemplateParameterFileName"
    Verbose               = $true
}
Write-Information "Parsing the following object to New-AzDeployment:"
Write-Information ($splat | Out-String)

New-AzDeployment @splat -ErrorAction "stop"