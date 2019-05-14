# Login to Azure account
Connect-AzAccount -UseDeviceAuthentication

# Get available locations
Get-AzLocation | Select-Object Location 

# Define variables for location and group
$location = "westeurope"
$resourceGroup = "Module03" 

# Create resource group
New-AzResourceGroup -Name $resourceGroup -Location $location 

# Create storage account
New-AzStorageAccount `
    -ResourceGroupName $resourceGroup `
    -Name "sj190519ps" `
    -Location $location `
    -SkuName Standard_LRS `
    -Kind StorageV2
