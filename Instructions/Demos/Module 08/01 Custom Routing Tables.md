# Module 08 Demonstration: Custom Routing Tables 

In this demonstration, you will learn how to create a route table, define a custom route, and associate the route with a subnet.

> **Note**: This demonstration requires a virtual network with at least one subnet.

### Create a routing table 

1. Access the Azure portal.
2. On the upper-left side of the screen, select **Services**, and then navigate to **Route tables**.
3. Select **+ Add**.
    - **Name**: *myRouteTablePublic*
    - **Subscription**: *select your subscription*
    - **Resource group**: *create or select a resource group*
    - **Location**: *select your location*
    - **BGP route propagation**: *Enabled*

4. Select **Create**.
5. Wait for the new routing table to be deployed.

### Add a route 

1. Select your new routing table, and then select **Routes**.
2. Select **+ Add**.
    - **Name**: *ToPrivateSubnet*
    - **Address prefix**: *10.0.1.0/24*
    - **Next hop type**: *Virtual appliance*
    - **Next hop address**: *10.0.2.4*
3. Read the information note: Ensure you have IP forwarding enabled on your virtual appliance. You can enable this by navigating to the respective network interface\'s IP address settings.
4. Select **Create**.
5. Wait for the new route to be deployed.

### Associate a route table to a subnet 

1. Navigate to the subnet you want to associate with the routing table.
2. Select **Route table**.
3. Select your new routing table **myRouteTablePublic**.
4. **Save** your changes.

### Use PowerShell to view your routing information 

1. Open the Cloud Shell.
2. View information about your new routing table.

``` posh
Get-AzRouteTable
```

3. Verify the **Routes** and **Subnet** information is correct.
