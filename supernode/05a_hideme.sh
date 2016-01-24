#!/bin/sh

uci -q batch <<EOF
    set network.hideme='interface'
    set network.hideme.proto='none'
    set network.hideme.ifname='tun-hideme'
    commit network

    add firewall zone
    set firewall.@zone[-1].forward='REJECT'
    set firewall.@zone[-1].output='ACCEPT'
    set firewall.@zone[-1].input='REJECT'
    set firewall.@zone[-1].network='hideme'
    set firewall.@zone[-1].mtu_fix='1'
    set firewall.@zone[-1].masq='1'
    set firewall.@zone[-1].name='hidemezone'

    add firewall forwarding 
    set firewall.@forwarding[-1].src='freifunk'
    set firewall.@forwarding[-1].dest='hidemezone'
    commit firewall

EOF
/etc/init.d/network restart
/etc/init.d/firewall restart
