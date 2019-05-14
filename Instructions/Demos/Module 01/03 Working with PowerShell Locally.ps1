# Login to Azure
Connect-AzAccount
# alias Login-AzAccount
# alias Add-AzAccount

# List Azure subscriptions in account
Get-AzSubscription

# Set subscription context of session (optional)
Set-AzContext -Subscription "<SubscriptionId>"

# List resource groups in subscription
Get-AzResourceGroup

#  Create resource group in subscription
New-AzResourceGroup -Name Test -Location westeurope

# List resource groups in subscription
Get-AzResourceGroup

# Delete created resource group in subscription
Remove-AzResourceGroup -Name Test

# List resource groups in subscription
Get-AzResourceGroup
