# Module 04 Demonstration: Service Endpoints 

In this demonstration, you will work with virtual network endpoints.

> **Note**: This demonstration requires a Storage Account with an uploaded file. **Note**: You could use Storage Explorer (Preview) in the portal.

### Create a storage account 

1. Create a **Storage Account**.
2. Within the Storage Account, create a **file share**, and **upload** a file.
3. For the Storage Account, use the **Shared Access Signature** blade to **Generate SAS and connection string**.
4. Use Storage Explorer and the connection string to access the file share.
5. Ensure you can view your uploaded file.

> **Note**: This part of the demonstration requires a virtual network with a subnet.

### Create a subnet service endpoint 

1. Select your virtual network, and then select a subnet in the virtual network.
2. Under **Service Endpoints**, view the **Services** drop-down and the different services that can be secured with an endpoint.
3. Check the **Microsoft.Storage** option.
4. **Save** your changes.

### Secure the storage to the service endpoint 

1. Return to your **storage account**.
2. Select **Firewalls and virtual networks**.
3. Change to **Selected networks**.
4. Add existing virtual network, verify your subnet with the new service endpoint is listed.
5. **Save** your changes.

### Test the storage endpoint 

1. Return to the Storage Explorer.
2. **Refresh** the storage account.
3. You should now have an access error similar to this one:

> **Note**: If you plan to use the storage account in other scenarios be sure to return the account to **All networks** in the **Firewalls and virtual networks** blade.
