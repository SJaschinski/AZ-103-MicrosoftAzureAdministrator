---
demo:
    title: 'Demonstration: File Shares'
    module: 'Module 03: Azure Storage'
---

# Module 03 Demonstration: File Shares 

In this demonstration, we will work with files shares and snapshots.

> **Note**: These steps require a storage account.

### Create a file share and upload a file 

1.  Access your storage account and click **Files**.
2.  Click **+ File share** and give your new file share a **Name** and a **Quota**.
3.  After your file share is created **Upload** a file.
4.  Notice the ability to **Add a directory**, **Delete share**, and edit the **Quota**.

### Manage snapshots 

1.  Access your file share.
2.  Select **Create Snapshot**.
3.  Select **View Snapshots** and verify your snapshot was created.
4.  Click the snapshot and verify it includes your uploaded file.
5.  Click the file that is part of the snapshot and review the **File properties**.
6.  Notice the choices to **Download** and **Restore** the snapshot file.
7.  Access the file share and delete the file you previously uploaded.
8.  **Restore** the file from the snapshot.

### Create a file share (PowerShell) 

1.  Create a context for your storage account and key. The context encapsulates the storage account name and account key.
2.  Create the file share. The name of your file share must be all lowercase.

``` posh
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
```

### Mount a file share (PowerShell) 

``` posh
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
```
