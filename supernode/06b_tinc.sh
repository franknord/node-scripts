#!/bin/sh
# Name anpassen!
cat > /etc/tinc/kbubackbone/hosts/mein_neuer_supernode <<EOF
Subnet=172.27.8.0/25
Compression=11
Cipher=aes-256-cbc 
EOF

# Name anpassen!
cat > /etc/tinc/kbubackbone/tinc.conf <<EOF
Mode =  Router
ConnectTo = paul
ConnectTo = paula
Name =  mein_neuer_supernode
Device= /dev/net/tun
EOF
