# Module 04 Demonstration: DNS Name Resolution 

In this demonstration, you will explore Azure DNS.

> **Note**: There is a DNS lab.

### Create a DNS zone 

1. Access the Azure Portal.
2. Search for the **DNS zones** service.
3. On the **Create DNS zone** blade enter the following values and **Create** the new DNS zone.
    - **Name**: *contoso.internal.com*
    - **Subscription**: *<your subscription>*
    - **Resource group**: Select or create a resource group
    - **Location**: Select your Location
4. Wait for the DNS zone to be created.
5. You may need to **Refresh** the page to see the new DNS zone.

### Add a DNS record set 

1. Select **+Record Set**.
2. Use the **Type** drop-down to view the different types of records.
3. Notice how the required information changes as you change record types.
4. Change the **Type** to **A** and enter these values.
    - **Name**: *ARecord*
    - **IP Address**: *1.2.3.4*
5. Notice you can add other records.
6. Click **OK** to save your record.
7. **Refresh** the page to see the new record set.
8. Make a note of your resource group name.

### Use PowerShell to view DNS information 

1. Open the Cloud Shell.
2. Get information about your DNS zones. Notice the name servers and number of record sets.

``` posh
Get-AzDnsZone -Name contoso.internal.com -ResourceGroupName Module04
```

3. Get information about your DNS record set.

``` posh
Get-AzDnsRecordSet -ResourceGroupName Module04 -ZoneName conto­so.internal.com
```

### View your name servers 

1. Access the Azure Portal and your DNS zone.
2. Review the Name Server information. There should be four name servers.
3. Make a note of the resource group.
4. Open the Cloud Shell.
5. Use PowerShell to confirm your NS records.

``` posh
# Retrieve the zone information
$zone = Get-AzDnsZone --Name contoso.internal.com --ResourceGroupName Module04
# Retrieve the name server records - look at the Records
Get-AzDnsRecordSet --Name "@" --RecordType NS --Zone $zone
```

6. You should see the same Name Servers that were shown in the portal.

### Test the resolution 

1. Continue in the Cloud Shell.
2. Use a Name Server in your zone to look up a record.

``` bat
nslookup arecord.contoso.internal.com <name server for the zone>
```

3. Nslookup should provide the IP address for the record.

### Explore DNS metrics 

1. Return to the Azure portal.
2. Select a DNS zone, and then select **Metrics**.
3. Use the **Metrics** drop-down to view the different metrics that are available.
4. Select **Query Volume**. If you have been using nslookup, there should be queries.
5. Use the **Line Chart** drop-down to see other chart types, like Area Chart, Bar Chart, and Scatter Chart.

> **Note**: For more information, you can see: **https://docs.microsoft.com/en-us/windows-server/administration/windows-com­mands/nslookup**
