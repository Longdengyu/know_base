
#! /bin/sh
TAP=tap0
WLAN=wlan0

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -F
iptables -t nat -A POSTROUTING -o $WLAN -j MASQUERADE
iptables -I FORWARD 1 -i $TAP -j ACCEPT
iptables -I FORWARD 1 -o $TAP -m state --state RELATED,ESTABLISHED -j ACCEPT
echo "config iptables for NAT done"
