---
demo:
    title: 'Demonstration: Connect to Linux Virtual Ma­chines'
    module: 'Module 02: Azure Virtual Machines'
---

# Module 02 Demonstration: Custom Script Extension 

In this demonstration, we will explore Custom Script Extensions.

### Run a PowerShell script on a virtual machine 

**Note**: This scenario requires a Windows virtual machine in the running state.

1.  Connect (RDP) to your Windows virtual machine and open a PowerShell prompt.
2.  Run this command and verify the Web Server feature status is **Available** but not Installed.

``` posh
Get-WindowsFeature -name Web-Server
```

3.  Create a file **Install\_IIS.ps1** on your local machine.
4.  Edit the file and add this command:

``` posh
Install-WindowsFeature -Name Web-Server
```

5.  In the Azure Portal, access your virtual machine, and select **Extensions**.
6.  Click **+ Add**. Take a minute to review the many different extensions that are available.
7.  Locate the **Custom Script Extension** resource, select, and click **Create**.
8.  Browse to your PowerShell script and upload the file. You should see a notification that the file was uploaded.
9.  Click **OK**.
10.  Select your CustomScriptExtension.
11.  Click View detailed status and verify provisioning succceeded.
12.  Return to your virtual machine RDP session.
13.  Verify the Web Server role was installed. This may take a couple of minutes.

``` posh
Get-WindowsFeature -name Web-Server
```

**Note**: You could also use the PowerShell Set-AzVmCustomScriptExtension command to deploy the extension. You would need to upload the script to blob container and use the URI. We will do this in the next demonstration.

``` posh
Set-AzVmCustomScriptExtension `
    -FileUri https://scriptstore.blob.core.windows.net/scripts/DeployWebServer.ps1 `
    -Run "PowerShell.exe" `
    -VmName vmName `
    -ResourceGroupName resourceGroup `
    -Location "location"
```