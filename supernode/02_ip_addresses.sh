#!/bin/sh

uci -q batch <<EOF
        set network.freifunk.proto='static'
        set network.freifunk.ipaddr='172.27.8.1'          # ANPASSEN !
        set network.freifunk.netmask='255.255.255.128'    # ANPASSEN !
        commit network
EOF
/etc/init.d/network restart
