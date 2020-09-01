$Computername = $env:COMPUTERNAME
$SerialNumber = (Get-WmiObject Win32_bios).SerialNumber
$NICName = (Get-NetAdapter | Where-Object Status -eq "Up").InterfaceIndex
$MACAddress = (Get-NetAdapter | Where-Object Status -eq "Up").MacAddress
$IPAddress = (Get-NetIPAddress | Where-Object {$_.InterfaceIndex -eq $NICName}).IPv4Address

"Computername:`t$Computername"
"Serialnumber:`t$SerialNumber"
"MAC Address:`t$MACAddress"
"IPv4 Address:`t$IPAddress"