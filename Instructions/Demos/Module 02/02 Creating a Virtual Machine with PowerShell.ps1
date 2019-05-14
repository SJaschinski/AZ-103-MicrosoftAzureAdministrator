# login
Connect-AzAccount -UseDeviceAuthentication

# create a resource group
New-AzResourceGroup -Name myResourceGroup -Location westeurope

# create the virtual machine when prompted, provide a username and password
New-AzVm `
    -ResourceGroupName "myResourceGroup" `
    -Name "myVM" `
    -Location "West Europe" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -OpenPorts 80,3389

# connect to virtual machine
Get-AzPublicIpAddress -ResourceGroupName "myResourceGroup" | Select-Object "IpAddress"
mstsc /v:13.94.149.89

# remove resources
Remove-AzResourceGroup -Name myResourceGroup
