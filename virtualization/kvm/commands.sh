#!/bin/bash

# URLs:
#  - https://habr.com/ru/post/170259/
#  - http://blog.erema.name/virsh-man-po-russki/18/
#  - https://ru.wikipedia.org/wiki/TUN/TAP
#  - http://linuxoidblog.blogspot.com/2016/01/qemu-kvm-linux.html

egrep '(vmx|svm)' /proc/cpuinfo

# KVM / Libvirt / Qemu

sudo apt install qemu-kvm bridge-utils libvirt-bin virt-manager
sudo adduser $USER libvirt

#qemu 
virsh -c qemu:///system list --all
virsh -c qemu:///system vol-list default
# pool-list --all
# pool-define-as storage dir --target /etc/libvirt/images/ # creating a pool
# pool-autostart storage
# pool-start storage
# pool-list –all
# 

virt-install --connect qemu:///system \
--name comp1 \
--ram 512 \
--vcpus=1 \
--disk pool=storage,cache=none,size=20, format=qcow2\
--disk /home/firsachi/Winxp.iso,device=cdrom \
--bridge=br0,model=e1000 \
--os-type=windows
--os-variant=winxp \
--graphics vnc,port=5901,listen=0.0.0.0

virt-install --connect qemu:///system \
--name comp1 \
--ram 512 \
--vcpus=1 \
--disk /dev/sdb, format=qcow2\
--disk /home/firsachi/Winxp.iso,device=cdrom \
--bridge=br0,model=e1000 \
--os-type=windows
--os-variant=winxp \
--graphics vnc,port=5901,listen=0.0.0.0

# Xen