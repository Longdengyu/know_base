#! /bin/sh
QEMU=qemu-system-x86_64
FILE=/home/deng/vms/deepin.qcow2
MEMORY=1024
TAP=tap0
$QEMU -drive file=$FILE,if=virtio\
	-m $MEMORY \
	-enable-kvm
