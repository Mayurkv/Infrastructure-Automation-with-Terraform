param(
    [string]$ResourceGroupName = "tfstate-rg",
    [string]$Location = "centralus",
    [string]$ContainerName = "tfstate"
)

# Create resource group
Write-Host "Creating resource group: $ResourceGroupName..."
az group create --name $ResourceGroupName --location $Location | Out-Null

# Create unique storage account name (must be globally unique)
$storageAccountName = "tfstate$((Get-Random -Maximum 99999))"

Write-Host "Creating storage account: $storageAccountName..."
az storage account create `
    --name $storageAccountName `
    --resource-group $ResourceGroupName `
    --location $Location `
    --sku Standard_LRS `
    --kind StorageV2 | Out-Null

# Get storage key
$storageKey = az storage account keys list `
    --resource-group $ResourceGroupName `
    --account-name $storageAccountName `
    --query "[0].value" -o tsv

# Create blob container
Write-Host "Creating blob container: $ContainerName..."
az storage container create `
    --name $ContainerName `
    --account-name $storageAccountName `
    --account-key $storageKey | Out-Null

Write-Host ""
Write-Host "✅ Terraform backend successfully created!"