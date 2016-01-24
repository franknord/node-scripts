#!/bin/sh

uci -q batch <<EOF
        add firewall zone
        set firewall.@zone[-1].forward='ACCEPT'
        set firewall.@zone[-1].output='ACCEPT'
        set firewall.@zone[-1].input='REJECT'
        set firewall.@zone[-1].network='bat0 freifunk mesh kbubackbone'
        set firewall.@zone[-1].mtu_fix='1'
        set firewall.@zone[-1].name='freifunk'

        add firewall rule 
        add firewall rule 

        set firewall.@rule[-1].name='Allow ICMP (Mesh)'
        set firewall.@rule[-1].src='freifunk'
        set firewall.@rule[-1].proto='icmp'                     
        set firewall.@rule[-1].family='ipv4'                    
        set firewall.@rule[-1].target='ACCEPT'                  

        set firewall.@rule[-2].name='Allow IGMP (Mesh)'
        set firewall.@rule[-2].src='freifunk'
        set firewall.@rule[-2].proto='igmp'                     
        set firewall.@rule[-2].family='ipv4'                    
        set firewall.@rule[-2].target='ACCEPT'                  

        commit firewall
EOF
/etc/init.d/firewall restart
