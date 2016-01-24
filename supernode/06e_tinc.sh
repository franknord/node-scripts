#!/bin/sh
uci -q batch <<EOF
    set tinc.kbubackbone='tinc-net'
    set tinc.kbubackbone.enabled='1'
    set tinc.kbubackbone.Name='mein_neuer_supernode'
    commit tinc

    set network.kbubackbone='interface'
    set network.kbubackbone.proto='none'
    commit network
EOF
/etc/init.d/network restart
/etc/init.d/tinc restart

