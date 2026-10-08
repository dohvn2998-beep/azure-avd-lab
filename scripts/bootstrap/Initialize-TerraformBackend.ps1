[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$ResourceGroupName,
    [Parameter(Mandatory)][string]$StorageAccountName,
    [Parameter(Mandatory)][string]$Location,
    [string]$ContainerName = "tfstate"
)

$ErrorActionPreference = "Stop"

az group create --name $ResourceGroupName --location $Location | Out-Null
az storage account create --name $StorageAccountName --resource-group $ResourceGroupName --location $Location --sku Standard_LRS --kind StorageV2 --allow-blob-public-access false | Out-Null
az storage account blob-service-properties update --account-name $StorageAccountName --resource-group $ResourceGroupName --enable-versioning true | Out-Null
az storage container create --name $ContainerName --account-name $StorageAccountName --auth-mode login | Out-Null

Write-Host "Backend bootstrap complete."
Write-Host "Create terraform/backend.hcl locally with these values:"
Write-Host "resource_group_name = $ResourceGroupName"
Write-Host "storage_account_name = $StorageAccountName"
Write-Host "container_name = $ContainerName"
Write-Host "key = azure-avd-lab.tfstate"
