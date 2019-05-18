# Module 04 Demonstration: Manage IP Addresses 

In this demonstration, you will learn how to retrieve static private IP address information for a network interface. You will run PowerShell commands to view the static private IP address information for the VM that was created in the previous demonstration. You will also remove the static private IP address that was added to the VM.

### Retrieve static private IP address information 

1. To view the static private IP address information for the VM created with the script above, run the following PowerShell command and note the values for *PrivateIpAddress* and *PrivateIpAllocationMeth­od*:

``` posh
Get-AzNetworkInterface -Name TestNIC -ResourceGroupName TestRG
```

2. Review the information returned which includes: Name, ResourceGroupName, Location, Id, Provision­ingState, VirtualMachine, IpConfigurations, DnsSettings, EnableIPForwarding, and NetworkSecuri­tyGroup. The information also includes whether the NIC is primary.
3. Notice in the IpConfigurations area there is a PrivateIPAddress and the PrivateIpAllocationMethod is static.

### Remove a static private IP address 

1. To remove the static private IP address added to the VM in the previous demonstration, run the following PowerShell commands:

``` posh
$nic=Get-AzNetworkInterface -Name TestNIC -ResourceGroupName TestRG
$nic.IpConfigurations[0].PrivateIpAllocationMethod = "Dynamic"
Set-AzNetworkInterface -NetworkInterface $nic
```

2. Review the output.
3. Notice in the IpConfigurations area, The PrivateIPAllocationMethod is now Dynamic.
