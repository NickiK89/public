# Finds remote RDP sessions on the specified server(s)

#requires -Module ActiveDirectory
[CmdletBinding()]
param(
    # Mandatory parameters
    [Parameter(Mandatory)]
    [string]$ServerName
)

function Get-NkrRdpSessions {
    param(
        [Parameter()]
        [string]$ServerName
    )
    
    $ServerName = 'NKDSADM'

    # Edit AllowRemoteRPC registry value to 1
    $AllowRemoteRPC = Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name AllowRemoteRPC
    if ($AllowRemoteRPC.AllowRemoteRPC -eq '0') {
        Write-Output "Setting AllowRemoteRPC to 1"
        try {
            Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name AllowRemoteRPC -Value '1' -ErrorAction Stop
        }
        catch [System.Security.SecurityException] {
            Write-Warning -Message "Insufficient rights - aborting"
            break 
        }
        Write-Output "Successfully edited registry value"

        $queryResults = (qwinsta.exe /server:$ServerName | ForEach-Object {(($_.trim() -replace "s+",","))} | ConvertFrom-Csv)
        $queryResults
    }
}