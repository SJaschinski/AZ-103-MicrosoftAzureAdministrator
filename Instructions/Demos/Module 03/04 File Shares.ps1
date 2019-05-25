# Login to Azure account
Connect-AzAccount -UseDeviceAuthentication

# Define variables for group and storage account
$resourceGroupName = "Module03"
$storageAccountName = "sj190519"

# Get storage account
$storageAccount = Get-AzStorageAccount `
    -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName

# Get storage account keys
$storageAccountKeys = Get-AzStorageAccountKey `
    -ResourceGroupName $resourceGroupName `
    -Name $storageAccountName

# Define variable for file share
$fileShareName = "demo"

# Define storage context
# $storageContext = New-AzStorageContext `
#    -StorageAccountName $storageAccountName `
#    -StorageAccountKey $storageAccountKeys[0].Value

# Create file share
New-AzStorageShare $fileShareName -Context $storageAccount.Context

# Get file share
$fileShare = Get-AzStorageShare -Context $storageAccount.Context | `
    Where-Object { $_.Name -eq $fileShareName -and $_.IsSnapshot -eq $false } 

if ($null -eq $fileShare) { throw [System.Exception]::new("Azure file share not found") }

# Define file share credentials
$userName = "Azure\$($storageAccount.StorageAccountName)"
$password = ConvertTo-SecureString `
    -String $storageAccountKeys[0].Value `
    -AsPlainText `
    -Force
$credential = New-Object System.Management.Automation.PSCredential `
    -ArgumentList $userName, $password

# Mount file share
$drive = "Z"
$root = "\\$($fileShare.StorageUri.PrimaryUri.Host)\$($fileShare.Name)"
New-PSDrive `
    -Name $drive `
    -PSProvider FileSystem `
    -Root $root `
    -Credential $credential `
    -Persist
