#!/bin/sh
cat > /etc/tinc/kbubackbone/tinc-up <<EOF
#!/bin/sh
ifconfig 172.27.8.1 netmask 255.255.255.255 \$INTERFACE up
ip route add 172.26.0.0/15 dev \$INTERFACE table 66 
ip route add 10.158.0.0/15 dev \$INTERFACE table 66 
ip route add 172.26.0.0/15 dev \$INTERFACE 
ip route add 10.158.0.0/15 dev \$INTERFACE 
ip route add default dev \$INTERFACE table 66 
ip route add 172.27.8.0/25 dev br-freifunk table 66 
EOF

chmod 755 /etc/tinc/kbubackbone/tinc-up
