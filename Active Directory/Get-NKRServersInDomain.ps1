# Retrieves all active servers in the current userdomain

#requires -Module ActiveDirectory
[CmdletBinding()]
param(
)

function Get-ServersInAd {
    # Get all servers
    $Servers = Get-ADComputer -Filter 'OperatingSystem -like "*server*" -and Enabled -eq "true"' -Properties Name,OperatingSystem,OperatingSystemVersion,IPv4Address
    $Servers | Sort-Object -Property Name | Select-Object -Property Name, OperatingSystem, OperatingSystemVersion, IPv4Address | Out-GridView
}
Get-ServersInAd