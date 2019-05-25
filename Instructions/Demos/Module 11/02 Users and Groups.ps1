# Create a new group called Developers
New-AzADGroup -DisplayName Developers -MailNickname Developers

# Retrieve the Developers group ObjectId
Get-AzADGroup

# Retrieve the user ObjectId for the member to add
Get-AzADUser

# Add the user to the group
Add-AzADGroupMember -MemberUserPrincipalName "myemail@domain.com" -Tar­getGroupDisplayName "MyGroupDisplayName"

# Verify the members of the group
Get-AzADGroupMember -GroupDisplayName "MyGroupDisplayName"
