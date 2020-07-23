# Used to 

#requires -Module DnsServer
[CmdletBinding()]
param(
    # Mandatory parameters

    [Parameter(Mandatory)]
    [string]$FilePath
)

function Set-DnsRecords {
    param(
        [Parameter()]
        [string]$FilePath
    )
    $Subnet = Import-Csv C:\Users\nkr\Desktop\Subnet254.csv
    $Subnet
}