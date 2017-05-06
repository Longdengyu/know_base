#! /bin/sh
TAP=tap0
ADDR=192.168.100.1
USER=deng
WLAN=wlan0

(ifconfig | grep $TAP 2>&1 > /dev/null )
# tap exist
if [ $? -eq 0 ]; then
    echo "$TAP" already exist
else
    tunctl -u $USER -t $TAP
    ifconfig $TAP $ADDR up
    echo "config tap device done"
fi
