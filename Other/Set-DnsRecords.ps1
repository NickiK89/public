# Used to update the DNS server with records of peripherals
# Imports a CSV with IP addresses and the hostname of the device(s)

#requires -Module DnsServer
[CmdletBinding()]
param(
    # Mandatory parameters
    [Parameter(Mandatory)]
    [System.IO.FileInfo]$FilePath,
    [Parameter(Mandatory)]
    [string]$ServerName
)

# Get domainname
$DomainName = $env:USERDNSDOMAIN

function Set-DnsRecords {
    $Records = Import-Csv -Path $FilePath -Delimiter ";"
    # Check if record already exists
    foreach ($record in $Records) {
        try {
            Resolve-DnsName -Name $record.Name -Type A -Server $ServerName -ErrorAction Stop | Out-Null
            Write-Host $record.Name "already found on the specified DNS server" -ForegroundColor Green
        }
        catch [System.ComponentModel.Win32Exception] {
            try {
                Add-DnsServerResourceRecordA -ComputerName $ServerName -Name $record.Name -ZoneName $DomainName -IPv4Address $record.IP -ErrorAction Stop
            }
            catch [Microsoft.Management.Infrastructure.CimException] {
                Write-Warning -Message "Permission denied"
            }
            Write-Host $record.Name "added to the specified DNS server" -ForegroundColor Green
        }
    }    
}
Set-DnsRecords