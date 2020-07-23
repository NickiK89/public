# Used to update the DNS server with records of peripherals
# Imports a CSV with IP addresses and the hostname of the device(s)

#requires -Module DnsServer
[CmdletBinding()]
param(
    # Mandatory parameters

    [Parameter(Mandatory)]
    [string]$FilePath,
    [string]$ServerName
)

# Get domainname
$DomainName = $env:USERDNSDOMAIN

function Set-DnsRecords {
    param(
        [Parameter()]
        [string]$FilePath
    )
    
    $Records = Import-Csv $FilePath

    # Check if record already exists
    foreach ($record in $Records) {
        Resolve-DnsName -Name $record -Type A -Server $ServerName -DnsOnly
    }    
    Add-DnsServerResourceRecordA
}