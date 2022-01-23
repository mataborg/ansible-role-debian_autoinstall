#!/bin/bash
# https://stackoverflow.com/questions/12973777/how-to-run-a-shell-script-at-startup/12973826#12973826

firstboot() {

sed -i 's/127.0.1.1/192.168.2.19/' /etc/hosts
apt update
apt install proxmox-ve postfix open-iscsi -y
apt full-upgrade -y
apt autoremove -y
apt remove os-prober -y
update-grub

}
firstboot
# Delete me
rm $0
