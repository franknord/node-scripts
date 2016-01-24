#!/bin/sh
cat > /etc/tinc/kbubackbone/tinc-up <<EOF
    #!/bin/sh
    ip addr add 172.27.8.1/32 dev \$INTERFACE
    ip route add 172.27.8.0/25 dev br-freifunk table 66 
    ip route add 172.26.0.0/15 dev \$INTERFACE table 66 
    ip route add 10.158.0.0/15 dev \$INTERFACE table 66 
    ip route add 172.26.0.0/15 dev \$INTERFACE 
    ip route add 10.158.0.0/15 dev \$INTERFACE 
    ip route add default dev \$INTERFACE table 66 
EOF

cat > /etc/tinc/kbubackbone/tinc-down <<EOF
    #!/bin/sh
    ip route del 172.27.8.0/25 dev br-freifunk table 66 
    ip route del 172.26.0.0/15 dev \$INTERFACE table 66 
    ip route del 10.158.0.0/15 dev \$INTERFACE table 66 
    ip route del 172.26.0.0/15 dev \$INTERFACE 
    ip route del 10.158.0.0/15 dev \$INTERFACE 
    ip route del default dev \$INTERFACE table 66 
EOF
chmod 755 /etc/tinc/kbubackbone/tinc-up
chmod 755 /etc/tinc/kbubackbone/tinc-down

