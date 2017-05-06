#! /bin/sh
QEMU=qemu-system-x86_64
FILE=/home/deng/iso/tinycore/tiny.iso
MEMORY=1024
TAP=tap0
$QEMU -drive file=$FILE,if=virtio \
	-m $MEMORY \
	-enable-kvm \
	-net nic,model=virtio,netdev=nic-0 \
	-netdev tap,ifname=$TAP,id=nic-0,script=no,downscript=no
