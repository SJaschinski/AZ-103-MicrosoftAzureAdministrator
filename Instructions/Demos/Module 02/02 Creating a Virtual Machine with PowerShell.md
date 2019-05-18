# Module 02 Demonstration: Creating a Virtual Machine with PowerShell 

In this demonstration, we will create a virtual machine using PowerShell.

### Create the virtual machine 

**Note:** You can use the Cloud Shell or a local version of PowerShell.

**Note:** There are many ways to create a virtual machine with PowerShell. This example is different from the one explained in the topic slides.

1.  Launch the Cloud Shell.
2.  Run this code:

```posh
# create a resource group
New-AzResourceGroup -Name myResourceGroup -Location westeurope

# create the virtual machine
# when prompted, provide a username and password
New-AzVm -ResourceGroupName "myResourceGroup" -Name "myVM" -Location "East US" -VirtualNetworkName "myVnet" -SubnetName "mySubnet" 
-SecurityGroupName "myNetworkSecurityGroup" -PublicIpAddressName "myPublicIpAddress" -OpenPorts 80,3389
```

### Verify the machine creation in the portal 

1.  Access the portal and view your virtual machines.
2.  Verify **myVM** was created.
3.  Review the VM settings.
4.  Notice this is a Windows machine in a new VNet and subnet.
5.  Notice the command started the machine.
6.  At this point you could use either the portal or PowerShell to make changes.

### Connect to the virtual machine 

1.  Retrieve the public IP address of the machine.

``` posh
Get-AzPublicIpAddress -ResourceGroupName "myResourceGroup" | Select-Object "IpAddress"
```

2.  Create an RDP session from your local machine. Replace the IP address with the public IP address of your VM. This command runs from a cmd window.

``` posh
mstsc /v:publicIpAddress
```

3.  When prompted, provide your login credentials for the machine. Be sure to **Use a different account**. Type the username as localhost\\username, enter password you created for the virtual machine, and then select **OK**. You may receive a certificate warning during the sign-in process. Select **Yes** or **Contin­ue** to create the connection
4.  When done, close the RDP connection to the VM.
5.  Clean up your resources. This will take a few minutes and remove the resource group and virtual machine.

``` posh
Remove-AzResourceGroup -Name myResourceGroup
```
