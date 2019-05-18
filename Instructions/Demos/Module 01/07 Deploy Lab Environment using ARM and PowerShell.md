# Module 01 Demonstration: Deploy Lab Environment using ARM and PowerShell 
In this demonstration, we will create the lab environment VM for this course using PowerShell and Resource Manager templates.

### Connect to your subscription 

``` posh
Connect-AzAccount
# Get-AzContext
# Get-AzSubscription
# Set-AzContext -Subscription < your subscription ID >
```

### Refer to the resource group and lock created before 

``` posh
Get-AzResourceGroup -Name LabEnvRG
Get-AzResourceLock -Name LabEnvLCK
```

If the resource group and lock have not been created use the following commands:

``` posh
New-AzResourceGroup -Name LabEnvRG -Location 'West Europe'
New-AzResourceLock -LockName LabEnvLCK -LockLevel CanNotDelete -ResourceGroupName LabEnvRG
```

### Deploy the template into the resource group 

``` posh
$templateFile = ".\Instructions\Demos\Lab Environment\template.json"
New-AzResourceGroupDeployment -ResourceGroupName LabEnvRG -Name LabEnvDPL -TemplateFile $templateFile
```

You will be prompted to enter values for:
- location. For example westeurope.
- adminUsername. For example azureuser.
- adminPassword. Any compliant password will work, for example Passw0rd0134.

Review the ARM template during deployment.

### Verify the template deployed 
Once you have successfully deployed the template, you need to verify the deployment. To do this, run the following commands:

``` posh
Get-AzVM
```

Note the VM name, then run the following command to obtain additional VM details:

```posh
Get-AzVM -Name < VM name > -ResourceGroupName < resource group name >
```

Note the extension value listed.

You can also list the VMs in your subscription with the **Get-AzVM -Status** command. This can also specify a VM with the **-Name** property. In the following example, we assign it to a PowerShell variable:

``` posh
$vm = Get-AzVM -Name < VM name > -ResourceGroupName < resource group name >
```

The interesting thing is that this is an object you can interact with. For example, you can take that object, make changes, and then push changes back to Azure with the **Update-AzVM** command:

``` posh
$ResourceGroupName = "ExerciseResources"
$vm = Get-AzVM -Name MyVM -ResourceGroupName $ResourceGroupName
$vm.HardwareProfile.vmSize = "Standard_A3"
Update-AzVM -ResourceGroupName $ResourceGroupName -VM $vm
```

**Note**: Depending on your datacenter location, you could receive an error related to the VM size not being available in your region. You can modify the vmSize value to one that is available in your region.

PowerShell\'s interactive mode is appropriate for one-off tasks. In our example, we\'ll likely use the same resource group for the lifetime of the project, which means that creating it interactively is reasona­ble. Interactive mode is often quicker and easier for this task than writing a script and then executing it only once.
