function Get-NKRDotNetVersion
{
    Write-Host 'Installed .NET Framework Components' -ForegroundColor Yellow
    Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -Recurse |
    Get-ItemProperty -Name Version,Release -ErrorAction 0 |
    Where-Object {$_.PSChildName -match '^(?!S)\p{L}'} |
    Where-Object {$_.PSChildName -match "Client" -or "Full"} |
    Select-Object -Property @{N='.NET Component';E={$_.PSChildName}}, @{N='Version';E={$_.Version}} |
    Sort-Object -Property Version -Descending |
    Format-Table -AutoSize
}
Get-NKRDotNetVersion