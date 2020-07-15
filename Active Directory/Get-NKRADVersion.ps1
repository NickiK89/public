<#
.Synopsis
Get the current schema version and forest and domain modes
.Description
The Get-NKRADVersion script queries the AD to discover the current AD schema version, forest mode and domain mode.
.Example
Get-NKRADVersion
Queries the current AD context
.Example
Get-NKRADVersion -DomainController DKDCP01
Gets the AD versions for the specifc domain controller DKDCP01
.Parameter DomainController
Specifies the domain controller to query
.Inputs
[string]
.Notes
Heavily inspired by Charlie Russels example in "Deploying and Managing Active Directory with Windows PowerShell (2015)"
Author:     Nicki Kristensen
Modification history:   2019-06-26 - First version (NICK)
#>

[CmdletBinding()]
Param(
    [Parameter(Mandatory=$False,Position=0)]
    [string]
    $DomainController
)

if ($DomainController) {
    $AD = Get-ADRootDSE -Server $DomainController
    Get-ADObject $AD.SchemaNamingContext -Server $DomainController -Property ObjectVersion
} else {
    $AD = Get-ADRootDSE
    Get-ADObject $AD.SchemaNamingContext -Property ObjectVersion
}
$Forest = $AD.ForestFunctionality
$Domain = $AD.DomainFunctionality

$VersionCodes = @"
Forest: $Forest
Domain: $Domain
"@
$VersionCodes