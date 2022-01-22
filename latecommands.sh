### Post-Install d-i late_commands script ###
sed -i 's/127.0.1.1/192.168.2.19/' /etc/hosts
apt update
apt full-upgrade -y
apt autoremove -y
echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bullseye pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg
sed -i 's/127.0.1.1/192.168.2.19/' /etc/hosts
apt install postfix open-iscsi -y
sed -i 's/127.0.1.1/192.168.2.19/' /etc/hosts
apt install proxmox-ve -y
apt autoremove -y
apt remove linux-image-amd64 'linux-image-5.10*' -y
apt remove os-prober -y
apt clean
update-grub