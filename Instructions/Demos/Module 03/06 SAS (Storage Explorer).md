---
demo:
    title: 'Demonstration: SAS (Storage Explorer)'
    module: 'Module 03: Azure Storage'
---

# Module 03 Demonstration: SAS (Storage Explorer) 

In this demonstration you will attach a storage account by using a Shared Access Signature.

> **Note**: This demonstration requires a storage account and access to Storage Explorer.

### Scenario 

A Shared Access Signature lets the admin of an Azure subscription grant temporary access to a storage account without having to provide Azure subscription credentials. To illustrate this scenario, let\'s say that User A is an admin of an Azure subscription, and User A wants to allow User B to access a storage account for a limited time with certain permissions:

- User A generates a SAS connection string for a specific time period and with the desired permissions.
- User A shares the SAS with the person (User B, in this example) who wants access to the storage account.
- User B uses Storage Explorer to attach to the account that belongs to User A by using the supplied SAS.

### Generate a SAS connection string for the account you want to share 

1.  In **Storage Explorer**, right-click the storage account you want share, and then select **Get Shared Access Signature**.
2.  Specify the time frame and permissions that you want for the account, and then click the **Create** button.
3.  Next to the Connection String text box, select **Copy** to copy it to your clipboard, and then click **Close**.
4.  This Connection string would be provided to User B.
5.  **Attach to a storage account by using a SAS Connection string**
6.  In **Storage Explorer**, open the **Connect Dialog**.
7.  Choose **Use a connection string** and then click **Next**.
8.  Paste your connection string into the **Connection string:** field. The **Display name:** field should populate. Click the **Next** button.
9.  Verify the information is correct, and select **Connect**.
10. After the storage account has successfully been attached, the storage account is displayed in the **Local and Attached** node with **(SAS)** appended to its name.

> **Note**: User B will now have access to the storage. Notice that you can also provide access for Azure Cosmos DB and Azure Data Lake Store.
