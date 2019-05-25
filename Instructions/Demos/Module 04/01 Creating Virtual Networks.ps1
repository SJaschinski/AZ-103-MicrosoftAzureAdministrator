$myVNet2 = New-AzVirtualNetwork `
    -ResourceGroupName myResourceGroup `
    -Loca­tion westeurope `
    -Name myVNet2 `
    -AddressPrefix 10.0.0.0/16

Get-AzVirtualNetwork -Name myVNet2

$mySubnet2 = Add-AzVirtualNetworkSubnetConfig `
    -Name mySubnet2 `
    -AddressPrefix 10.0.0.0/24 `
    -VirtualNetwork $myVNet2

    Get-AzVirtualNetworkSubnetConfig `
    -Name mySubnet2 `
    -VirtualNetwork $myVNet2

$mySubnet2 | Set-AzVirtualNetwork
