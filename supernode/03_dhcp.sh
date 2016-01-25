#!/bin/sh
uci -q batch <<EOF
    set dhcp.freifunk='dhcp'
    set dhcp.freifunk.interface='freifunk'
    set dhcp.freifunk.start='2'
    set dhcp.freifunk.limit='125'                       # Ggf. ANPASSEN !
    set dhcp.freifunk.leasetime='10m'
    set dhcp.freifunk.dhcpv6='disabled'
    set dhcp.freifunk.ra='disabled'
    set dhcp.freifunk.dhcp_option='6,172.27.255.3' # Freifunk-KBU Anycast DNS, Ggf. anpassen
    commit dhcp

    add firewall rule 
    
    set firewall.@rule[-1].name='Allow DHCP request (Mesh)'
    set firewall.@rule[-1].src='freifunk'
    set firewall.@rule[-1].dest_port='67-68'
    set firewall.@rule[-1].proto='udp'
    set firewall.@rule[-1].target='ACCEPT'
    set firewall.@rule[-1].family='ipv4'   

    commit firewall
EOF
/etc/init.d/dnsmasq restart
/etc/init.d/firewall restart
