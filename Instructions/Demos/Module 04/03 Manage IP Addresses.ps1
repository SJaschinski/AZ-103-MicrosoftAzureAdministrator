Get-AzNetworkInterface -Name TestNIC -ResourceGroupName TestRG

$nic=Get-AzNetworkInterface -Name TestNIC -ResourceGroupName TestRG
$nic.IpConfigurations[0].PrivateIpAllocationMethod = "Dynamic"
Set-AzNetworkInterface -NetworkInterface $nic
