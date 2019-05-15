Get-AzDnsZone -Name contoso.internal.com -ResourceGroupName Module04

Get-AzDnsRecordSet -ResourceGroupName Module04 -ZoneName conto­so.internal.com

# Retrieve the zone information
$zone = Get-AzDnsZone --Name contoso.internal.com --ResourceGroupName Module04
# Retrieve the name server records - look at the Records
Get-AzDnsRecordSet --Name "@" --RecordType NS --Zone $zone

nslookup arecord.contoso.internal.com <name server for the zone>
