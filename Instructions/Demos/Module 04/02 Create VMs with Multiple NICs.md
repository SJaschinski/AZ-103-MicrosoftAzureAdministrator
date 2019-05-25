# Module 04 Demonstration: Create VMs with Multiple NICs 

In this demonstration, you will learn how to create and configure multiple NICs and then attach those NICs to a VM. You can replace example parameter names with your own values if you prefer.

This demonstration uses the Azure CLI and assumes the following preparatory steps:

1. You are using the latest version of the **Azure CLI1** and are logged in to your Azure account.

2. You have created a resource group in an appropriate location and a virtual network with a subnet, an additional backend subnet, and a network security group.For example, using **az network vnet create**, create a virtual network named *myVnet* and subnet named *mySubnetFrontEnd*:

``` sh
az network vnet create \
    --resource-group myResourceGroup \
    --name myVnet \
    --address-prefix 10.0.0.0/16 \
    --subnet-name mySubnetFrontEnd \
    --subnet-prefix 10.0.1.0/24
```

3. Using **az network vnet subnet** create a subnet for the back-end traffic named *mySubnetBackEnd*:

``` sh
az network vnet subnet create \
    --resource-group myResourceGroup \
    --vnet-name myVnet \
    --name mySubnetBackEnd \
    --address-prefix 10.0.2.0/24
```

4. Now using **az network nsg create**, create a network security group named *myNetworkSecurityGroup*:

``` sh
az network nsg create \
    --resource-group myResourceGroup \
    --name myNetworkSecurityGroup
```

### Create and configure multiple NICs 

Using **az network nic create**, create two NICs, named *myNic1* and *myNic2*, connect the network security group, with one NIC connecting to each subnet:

``` sh
az network nic create \
    --resource-group myResourceGroup \
    --name myNic1 \
    --vnet-name myVnet \
    --subnet mySubnetFrontEnd \
    --network-security-group myNetworkSecurityGroup
```

### Create a VM and attach the NICs 

When you create the VM, specify the NICs you created with the *--nics* parameter. You also need to take care when you select the VM size. There are limits for the total number of NICs that you can add to a VM. Using **az vm create**, create a Linux VM named *myVM*:

``` sh
az vm create \
    --resource-group myResourceGroup \
    --name myVM \
    --image UbuntuLTS \
    --size Standard_DS3_v2 \
    --admin-username azureuser \
    --generate-ssh-keys \
    --nics myNic1 myNic2
```

> **Note:** Return to the portal and verify the virtual machine now has two interfaces.
