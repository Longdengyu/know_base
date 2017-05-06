#! /bin/sh
# hostA
echo "setting up network..."
NET=1
ID=A

HOSTIP=192.168.$NET.11
GUESTIP=192.168.$NET.12
NETMASK=255.255.255.0
USERID=deng
IFNAME=`sudo tunctl -b -u $USERID`
MAC=00:00:00:00:00:0$NET
sudo ifconfig $IFNAME $HOSTIP netmask $NETMASK up
##-------------------##
QEMU=qemu-system-x86_64
FILE=/home/deng/vms/host$ID.qcow2
MEMORY=1024
TAP=tap0
$QEMU -drive file=$FILE,if=virtio \
	-m $MEMORY \
	-enable-kvm \
	-net nic,model=virtio,netdev=nic-$IFNAME-$GUESTIP,macaddr=$MAC \
	-netdev tap,ifname=$IFNAME,id=nic-$IFNAME-$GUESTIP,script=no,downscript=no

##-------------------##
echo "setting down the network..."
sudo tunctl -d $IFNAME 2>&1 > /dev/null
