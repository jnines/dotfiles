#!/bin/bash

echo "| refresh=true size=12 iconName=virtualbox"
echo "---"

vmdir="/1tb/vm"
vmdir2="$vmdir/*/"
declare -a vmlist=( "${vmdir}"/*/*.vbox )

echo "VirtualBox | bash='/usr/bin/virtualbox' iconName=virtualbox"
shopt -s nocasematch
for i in "${vmlist[@]}"
do
    case $i in
        exit) break ;;
        *"arch"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-archlinux" ;;
        *"artix"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-artix" ;;
        *"alpine"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-alpine" ;;
        *"centos"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-centos" ;;
        *"debian"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-debian" ;;
        *"fedora"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-fedora" ;;
        *"mint"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-linux-mint" ;;
        *"opensuse"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-opensuse" ;;
        *"pop"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-pop-os" ;;
        *"redhat"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-rhel" ;;
        *"solus"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-solus" ;;
        *"ubuntu"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-ubuntu";;
        *"void"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-void" ;;
        *"win"*) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=distributor-logo-windows" ;;
        *) echo "${i#$vmdir2} | bash='/usr/bin/virtualbox ${i}' iconName=virtualbox-ose" ;;
    esac
done
shopt -u nocasematch
