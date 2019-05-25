# Module 01 Demonstration: Resource Groups
In this demonstration, we will create and delete resource locks.

> **Note**: Only the roles Owner and User Access Administrator can manage the locks on the resources. 

### Manage resource groups in the portal

1. Access the Azure portal.
2. Create a resource group. Remember the name of this resource group.
3. In the Settings blade for the resource group, select Locks.
4. To add a lock, select Add. If you want to create a lock at a parent level, select the parent. The currently selected resource inherits the lock from the parent. For example, you could lock the resource group to apply a lock to all its resources.
5. Give the lock a name and lock type. Optionally, you can add notes that describe the lock.
6. To delete the lock, select the ellipsis and Delete from the available options.

### Manage resource groups with PowerShell
1. Access the Cloud Shell.
2. Create the resource lock and confirm your action.

``` posh
New-AzResourceLock -LockName <lockName> -LockLevel CanNotDelete -ResourceGroupName <resourceGroupName>
```

3. View resource lock information. Notice the LockId that will be used in the next step to delete the lock.

``` posh
Get-AzResourceLock
```

4. Delete the resource lock and confirm your action.

``` posh
Remove-AzResourceLock -LockName <Name> -ResourceGroupName <GroupName>
```

5. Verify the resource lock has been removed.

``` posh
Get-AzResourceLock
```

> **Exam**: Configure resource locks, move resources across resource groups, and remove resource groups are part of the certification exam.
