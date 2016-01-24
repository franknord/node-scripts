#!/bin/sh

uci -q batch <<EOF
    set openvpn.hideme_config='openvpn'
    set openvpn.hideme_config.enabled='1'
    set openvpn.hideme_config.config='/etc/hide.me/Roosendaal.ovpn'
    commit openvpn
EOF
/etc/init.d/openvpn restart
