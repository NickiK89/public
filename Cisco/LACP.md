# LACP

LACP (802.3ad) allows interfaces to be bundled for improved throughput or redundancy.  
Up to 16 interfaces can be bundled together, however only 8 can be active at the same time.

## Configuring LACP
1. `Router> enable`
2. `Router# configure terminal`
3. `Router(config)# interface port-channel <number>`
4. `Router(config-if)# interface <number>`
5. `Router(config-if)# channel-group <number> mode {active | passive}`

## Example
>Router> enable
