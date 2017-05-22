#!/bin/bash
#$file="/etc/systemd/network/10-static-en.network"
echo "ip=$1"
rm /etc/systemd/network/*
cat > "/etc/systemd/network/10-static-en.network"<<EOF
[Match]
Name=eth0
[Network]
Address=$1/24
Gateway=192.168.62.2
DNS=192.168.62.2
EOF
chmod 644 /etc/systemd/network/10-static-en.network
systemctl restart systemd-networkd
