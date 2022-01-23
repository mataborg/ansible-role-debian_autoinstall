# https://linuxconfig.org/how-to-automatically-execute-shell-script-at-startup-boot-on-systemd-linux 
# https://www.mauras.ch/systemd-run-it-last.html 
### Post-Install d-i late_commands script ###

latecommands() {

# Modify Hosts file
sed -i 's/127.0.1.1/192.168.2.19/' /etc/hosts

# Download systemd component and PVE install script
curl -sSL 'https://raw.githubusercontent.com/mataborg/ansible-role-debian_autoinstall/main/firstboot.sh' -o "/root/firstboot.sh"
curl -sSL 'https://raw.githubusercontent.com/mataborg/ansible-role-debian_autoinstall/main/firstboot.service' -o "/etc/systemd/system/"

# Enable systemd to run PVE install script on boot
chmod 744 /root/firstboot.sh
chmod 664 /etc/systemd/system/firstboot.service
systemctl daemon-reload
systemctl enable firstboot.service

}

latecommands
