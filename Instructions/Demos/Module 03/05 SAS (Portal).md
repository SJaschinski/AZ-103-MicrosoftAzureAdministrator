---
demo:
    title: 'Demonstration: SAS (Portal)'
    module: 'Module 03: Azure Storage'
---

# Module 03 Demonstration: SAS (Portal) 

In this demonstration, we will create a shared access signature.

**Note**: This demonstration requires a storage account, with a blob
container, and an uploaded file.

### Create a SAS at the service level 

1.  Sign into the Azure portal.
2.  Locate the storage account you want to work with and open it. Drill down to your blob container.
3.  Click the file you would like to provide access to.
4.  Select the **Generate SAS** tab.
5.  Configure the shared access signature using the following parameters:
    - **Permissions**: Read
    - **Start and expiry date/time**: Today\'s date to start, 1 year out for expiry
    - **Allowed protocols**: HTTPS
    - **Signing key**: Key1
6.  Copy the **Blob Server SAS URL** and paste the URL into a browser.
7.  Verify the blob file displays.
8.  Review the different URL parameters that you learned about in the lesson.

### Create a SAS at the account level 

1.  Return to your storage account.
2.  Click **Shared access signature**.
3.  Notice you can configure a variety of services, resource types, and permissions.
4.  Click **Generate SAS and connection string**.
5.  Review the connection string, SAS token, and URL information that is provided.
