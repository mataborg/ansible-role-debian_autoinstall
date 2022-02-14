#!/bin/bash
# https://stackoverflow.com/questions/12973777/how-to-run-a-shell-script-at-startup/12973826#12973826
### First system boot PVE install script ###

firstboot() {

    # Install PVE
    sed -i 's/127.0.1.1/192.168.2.19/' /etc/hosts
    echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bullseye pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
    wget https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg
    apt update
    apt full-upgrade -y
    apt install proxmox-ve -y
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


