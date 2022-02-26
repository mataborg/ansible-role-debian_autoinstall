# Ansible Role: ProxMox Autoinstall
![GitHub](https://img.shields.io/github/license/mataborg/ansible-role-proxmox_autoinstall)
[![SL Scan](https://github.com/mataborg/ansible-role-proxmox_autoinstall/actions/workflows/shiftleft.yml/badge.svg?branch=main)](https://github.com/mataborg/ansible-role-proxmox_autoinstall/actions/workflows/shiftleft.yml)

This repo is a fork of notthebee's ansible playbook to automatically generate and deploy an Ubuntu server image to a remote computer.

## WARNING
```
This role will WIPE the first disk available during the installation process, proceed with caution.
```

## Caution
* Piping to shell is a controversial topic, as it prevents you from reading code that is about to run on your system. Please note that the lastcommand.sh file commands may be directly appended to the preseed.cfg file if you prefer not to pipe to shell.

### This role will:
* Download and verify (SHA256) the specified Debian netinst server edition ISO
* Unpack the ISO and integrate preseeding for automated installation of a Debian environment to ProxMox PVE
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
    - role: proxmox_autoinstall
```

### Variables
* `iso_arch` – Architecture of the output ISO file. `amd64` and `arm64` are supported



Other variables are more or less self-explanatory and can be found in defaults/main.yml

### Usage:
```
git clone --depth 1 https://github.com/mataborg/ansible-role-proxmox_autoinstall /home/eagle/.ansible/roles/
```
```
ansible-playbook .ansible/playbooks/proxmox_autoinstall.yml --ask-become-pass
```
