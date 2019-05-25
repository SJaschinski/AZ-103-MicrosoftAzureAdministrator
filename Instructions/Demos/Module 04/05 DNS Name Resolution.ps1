Get-AzDnsZone -Name befirebrand.com -ResourceGroupName Module04

Get-AzDnsRecordSet -ResourceGroupName Module04 -ZoneName befirebrand.com

# Retrieve the zone information
$zone = Get-AzDnsZone -Name befirebrand.com -ResourceGroupName Module04
# Retrieve the name server records - look at the Records
Get-AzDnsRecordSet -Name "@" -RecordType NS -Zone $zone

nslookup demo.befirebrand.com ns1-09.azure-dns.com.
