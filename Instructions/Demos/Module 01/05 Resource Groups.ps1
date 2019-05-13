# Login to Azure account
Connect-AzAccount -UseDeviceAuthentication
# Get-AzContext
# Get-AzSubscription
# Set-AzContext -Subscription "<SubscriptionId>"

# Create resource group for lab environment
New-AzResourceGroup -Name LabEnvRG -Location 'West Europe'

# Create lock for lab environment to prevent deletion
New-AzResourceLock -LockName LabEnvLCK -LockLevel CanNotDelete -ResourceGroupName LabEnvRG
Get-AzResourceLock
# Remove-AzResourceLock -LockName LabEnvLCK
