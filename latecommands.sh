### Post-Install d-i late_commands script ###
apt update
apt full-upgrade -y
sed -i 's/127.0.1.1/192.168.2.19/' /etc/hosts
echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bullseye pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg
apt update
apt install proxmox-ve postfix open-iscsi -y
sed -i 's/127.0.1.1/192.168.2.19/' /etc/hosts
apt full-upgrade -y
apt autoremove -y
apt remove os-prober -y
update-grub
