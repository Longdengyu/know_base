#! /bin/sh
QEMU=qemu-system-x86_64
FILE=/home/deng/vms/mininet.qcow2
MEMORY=1024
TAP=tap0
$QEMU -drive file=$FILE,if=virtio\
	-m $MEMORY \
	-enable-kvm
	-net nic,vlan=0 -net tap,vlan=0,ifname=$TAP,script=no
	-net nic,vlan=0 -net tap,vlan=0,ifname=$TAP,script=no
