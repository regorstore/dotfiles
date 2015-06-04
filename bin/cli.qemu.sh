#!/bin/sh
# This script created by AQEMU
/usr/bin/kvm  -smp 4 -enable-kvm -m 2048 -localtime -hda "debian.qcow2" -net nic,vlan=0,macaddr=00:e0:4c:36:78:27,model=e1000 -net user,vlan=0,hostname=oetest -redir tcp:8080:10.0.2.15:80 -redir tcp:8069:10.0.2.15:8069 -redir tcp:8432:10.0.2.15:5432 -redir tcp:8443:10.0.2.15:443 -redir tcp:8022:10.0.2.15:22 -redir tcp:8000:10.0.2.15:8000 -redir tcp:8900:10.0.2.15:8900 -redir tcp:8901:10.0.2.15:8901 -usb -device usb-host,hostbus=1,hostaddr=1 -device usb-host,hostbus=2,hostaddr=1 -name "vm.debian" -vnc :12 $*
