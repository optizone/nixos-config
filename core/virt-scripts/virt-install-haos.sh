#!/usr/bin/env bash

export LIBVIRT_DEFAULT_URI="qemu:///system"

virsh --connect qemu:///system

# virsh start haos
# virt-viewer -f -w -a haos
#
virt-install \
        --connect qemu:///system \
        --name haos \
        --boot uefi \
        --os-variant=generic \
        --import \
        --disk haos_ova-15.2.qcow2 \
        --cpu host \
        --vcpus 2 \
        --memory 4098 \
        --network network=bridged-network
# --graphics "spice,listen=0.0.0.0"

# virt-install
#       --name haos
#       --description "Home Assistant OS"
#       --os-variant=generic
#       --ram=4096 --vcpus=2
#       --disk "$HOME/vms/haos_ova-15.2.qcow2",bus=scsi
#       --controller type=scsi,model=virtio-scsi
#       --import
#       --graphics none
#       --boot uefi

# virt-install --name haos --description "Home Assistant OS" --os-variant=generic --ram=4096 --vcpus=2 --disk "$HOME/vms/haos_ova-15.2.qcow2",bus=scsi --controller type=scsi,model=virtio-scsi --import --graphics none --boot uefi --hostdev 003.003
