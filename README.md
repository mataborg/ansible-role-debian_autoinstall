This repo is a fork of notthebee's ansible playbook to automatically generate and deploy an Ubuntu server image to a remote computer.

# Ansible Role: Debian Autoinstall

### WARNING
* This role will WIPE the first disk available during the installation process, proceed with caution.

### This role will:
* Download and verify (SHA256) the specified Debian netinst server edition ISO
* Unpack the ISO and integrate preseeding for automated installation of a Debian to ProxMox PVE
* Repack the ISO and (optionally) upload it to [PiKVM](https://pikvm.org/) for futher installation

### Special thanks to:
* notthebee for providing an ansible playbook to remotely image a server PC to build upon.

### Example playbook:
```
---
- hosts: all
  gather_facts: yes
  become: no

  roles:
    - role: debian_autoinstall
```

### Variables
* **boot_drive_serial** – the serial number of the drive where you want to install Ubuntu. You can find it out using `ls /dev/disk/by-id`. Make sure to omit the interface (e.g. **ata-** or **scsi-**).
* **iso_arch** – Architecture of the output ISO file. `amd64` and `arm64` are supported



Other variables are more or less self-explanatory and can be found in defaults/main.yml

### Usage:
```
git clone https://github.com/mataborg/ansible-role-debian_autoinstall.git /home/eagle/.ansible/roles/
```
Modify the preseed.cfg and latecommands.sh to tailor the install for your personal environment.
```
ansible-playbook .ansible/playbooks/debian_autoinstall.yml --ask-become-pass
```