# https://linuxconfig.org/how-to-automatically-execute-shell-script-at-startup-boot-on-systemd-linux 
# https://www.mauras.ch/systemd-run-it-last.html 
### Post-Install d-i late_commands script ###

latecommands() {

    # Modify Hosts file
    sed -i 's/127.0.1.1/192.168.2.19/' /etc/hosts

    # Add PVE Repository to install PVE Kernel package
    echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
    wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg
    apt update
    apt install proxmox-default-kernel -y

    # Download systemd component and PVE install script
    curl -sSL 'https://raw.githubusercontent.com/mataborg/ansible-role-debian_autoinstall/main/firstboot.sh' -o "/root/firstboot.sh"
    curl -sSL 'https://raw.githubusercontent.com/mataborg/ansible-role-debian_autoinstall/main/firstboot.service' -o "/etc/systemd/system/firstboot.service"

    # Enable systemd to run PVE install script on boot
    chmod 744 /root/firstboot.sh
    chmod 664 /etc/systemd/system/firstboot.service
    systemctl enable firstboot.service

}

latecommands
