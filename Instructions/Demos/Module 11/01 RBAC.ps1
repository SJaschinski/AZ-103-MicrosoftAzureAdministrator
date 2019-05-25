# Use this script in Cloud Shell
# List role definitions
Get-AzRoleDefinition | Format-Table Name, Description

# List the actions of a role
Get-AzRoleDefinition Owner | Format-List Actions, NotActions

# List role assignments
Get-AzRoleAssignment -ResourceGroupName Module11
