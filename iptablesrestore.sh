!# /bin/bash
EXTIF=wwan0
INTIF=eth0
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
