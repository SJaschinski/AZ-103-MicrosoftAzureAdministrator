# Module 04 Demonstration: Creating Virtual Networks 

In this demonstration, you will create virtual networks.

**Note**: You can use the suggested values for the settings, or your own custom values if you prefer.

### Create a virtual network in the portal 

1. Sign in the to the Azure portal and search for **Virtual Networks**.
2. On the Virtual Networks page, click **Add**. 
    - **Name**: *myVNet1*.
    - **Address**:10.1.0.0/16.
    - **Subscription**: Select your subscription.
    - **Resource group**: Select new or choose an existing resource group
    - **Location** - Select your location
    - **Subnet** - Enter mySubnet1.
    - **Subnet - Address range**: 10.1.0.0/24
3. Leave the rest of the default settings and select **Create**.
4. Verify your virtual network was created.

### Create a virtual network using PowerShell 

1. Create a virtual network. Use values as appropriate.

``` posh
$myVNet2 = New-AzVirtualNetwork `
    -ResourceGroupName myResourceGroup `
    -Loca­tion westeurope `
    -Name myVNet2 `
    -AddressPrefix 10.0.0.0/16
```

2. Verify your new virtual network information.

``` posh
Get-AzVirtualNetwork -Name myVNet2
```

3. Create a subnet. Use values as appropriate.

``` posh
$mySubnet2 = Add-AzVirtualNetworkSubnetConfig `
    -Name mySubnet2 `
    -AddressPrefix 10.0.0.0/24 `
    -VirtualNetwork $myVNet2
```

4. Verify your new subnet information.

``` posh
Get-AzVirtualNetworkSubnetConfig `
    -Name mySubnet2 `
    -VirtualNetwork $myVNet2
```
5. Associate the subnet to the virtual network.

``` posh
$mySubnet2 | Set-AzVirtualNetwork
```

6. Return to the portal and verify your new virtual network with subnet was created.
