# Upgrade IOS software

Upgrades the currently installed IOS software to a newer version.  
.bin or .tar file must be downloaded from Cisco using a Cisco account.  
In the below example, a 2960+48TC-S is being upgraded from 15.0(2)SE8 to 15.2(7)E12.  
The file is located on a PC with TFTPD64 running, using the IP address 192.168.1.10.  

## Preparing and uploading software
1. `Switch>enable`
2. `Switch#configure terminal`
3. `Switch(config)#ip default-gateway 192.168.1.1`
4. `Switch(config)#interface Vlan1`
5. `Switch(config-if)#ip add 192.168.1.100 255.255.255.0`
6. `Switch#delete /recursive /force flash:c2960-lanlitek9-mz.150-2.SE8`
7. `Switch#archive tar /xtract tftp://192.168.1.10/c2960-lanbasek9-tar.152-7.E12.tar flash:`
8. `Switch#verify flash:c2960-lanbasek9-tar.152-7.E12/c2960-lanbasek9-tar.152-7.E12.bin`
9. `Switch#boot system flash:/c2960-lanbasek9-tar.152-7.E12/c2960-lanbasek9-tar.152-7.E12.bin`
10. `Switch#write memory`
11. `Switch#reload now`
