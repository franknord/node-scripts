#!/bin/sh
uci -q batch <<EOF
    add network rule
    add network rule

    set network.@rule[-1].in='freifunk'
    set network.@rule[-1].lookup='66'

    set network.@rule[-3].dest='172.27.8.0/25' # Anpassen!
    set network.@rule[-3].lookup='66'
    commit network
EOF
/etc/init.d/network restart

