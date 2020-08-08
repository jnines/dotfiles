#!/bin/bash

echo "| refresh=true size=12 iconName=qemu"
echo "---"

vmdir="/1tb/vm"
declare -a vmlist=( "${vmdir}"/*.qcow2 )
trim=(/1tb/vm/ .qcow2)

for tr in "${trim[@]}"
do
    vmlist=("${vmlist[@]/$tr}")
done
echo "Virt-Manager | bash='/usr/bin/virt-manager' iconName=virt-manager"
shopt -s nocasematch
for i in "${vmlist[@]}"
do
    case $i in
        exit) break ;;
        *"arch"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-archlinux" ;;
        *"artix"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-artix" ;;
        *"alpine"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-alpine" ;;
        *"centos"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-centos" ;;
        *"debian"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-debian" ;;
        *"fedora"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-fedora" ;;
        *"mint"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-linux-mint" ;;
        *"opensuse"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-opensuse" ;;
        *"pop"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-pop-os" ;;
        *"redhat"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-rhel" ;;
        *"solus"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-solus" ;;
        *"ubuntu"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-ubuntu";;
        *"void"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-void" ;;
        *"win"*) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=distributor-logo-windows" ;;
        *) echo "${i%.qcow2} | bash='/usr/bin/virsh start ${i} && /usr/bin/virt-viewer ${i}' iconName=qemu" ;;
    esac
done
shopt -u nocasematch
