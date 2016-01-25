#!/bin/sh

cat > /etc/hide.me/up.sh <<EOF
#!/bin/sh
ip route add 0.0.0.0/1 table 66 dev \$dev
ip route add 128.0.0.0/1 table 66 dev \$dev 
EOF

chmod 755 /etc/hide.me/up.sh
