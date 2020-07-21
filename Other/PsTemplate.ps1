# A template for creating PowerShell scripts
# Created using the blogpost on https://adamtheautomator.com/beautiful-powershell-code/

#requires -Module ActiveDirectory
[CmdletBinding()]
param(
    # Mandatory parameters

    [Parameter(Mandatory)]
    [string]$FilePath
)

function New-Stuff {
    param(
        [Parameter()]
        [string]$FilePath
    )

    # Enter code to do something here
}