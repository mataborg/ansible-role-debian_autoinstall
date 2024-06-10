#!/bin/bash
# https://stackoverflow.com/questions/12973777/how-to-run-a-shell-script-at-startup/12973826#12973826
### First system boot PVE install script ###

firstboot() {

    # Install PVE/Remove shipped Debian Kernel
    sed -i 's/127.0.1.1/192.168.2.19/' /etc/hosts
    apt update
    apt full-upgrade -y
    apt install proxmox-ve -y
    apt remove linux-image-amd64 'linux-image-6.1*' -y
    apt remove os-prober -y
    apt autoremove -y
    update-grub

    # Cleaning house
    rm /root/firstboot.sh
    rm /etc/systemd/system/firstboot.service
    systemctl daemon-reload

    # Delete me
    rm -- "$0"

    reboot

}

firstboot


