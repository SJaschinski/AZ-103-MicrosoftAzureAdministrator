# Login to Azure account
Connect-AzAccount -UseDeviceAuthentication
# Get-AzContext
# Get-AzSubscription
# Set-AzContext -Subscription "<SubscriptionId>"

# Refer to the resource group and lock created before
Get-AzResourceGroup -Name LabEnvRG
Get-AzResourceLock -ResourceGroupName LabEnvRG -LockName LabEnvLCK
# New-AzResourceGroup -Name LabEnvRG -Location 'West Europe'
# New-AzResourceLock -LockName LabEnvLCK -LockLevel CanNotDelete -ResourceGroupName LabEnvRG

# Deploy the template into the resource group
$templateFile = ".\Instructions\Demos\Lab Environment\template.json"
New-AzResourceGroupDeployment -ResourceGroupName LabEnvRG -Name LabEnvDPL -TemplateFile $templateFile

# Verify the template deployed
Get-AzVM
Get-AzVM -Name LabEnvVM -ResourceGroupName LabEnvRG
$vm = Get-AzVM -Name LabEnvVM -ResourceGroupName LabEnvRG
$vm.HardwareProfile.vmSize = "Standard_D4s_v3"
Update-AzVM -ResourceGroupName LabEnvRG -VM $vm
