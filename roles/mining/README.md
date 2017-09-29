# Overview

This is a basic Ansible role for setting up crypto mining on an Ubuntu host

# Installation

Official Docs: http://docs.ansible.com/ansible/latest/intro_installation.html

## Install Ansible (Ubuntu)
```
$ sudo apt-get update
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```

## Setup
Create file: group_vars/miners with contents
```
---
mining_email: user@domain.com
```

# Run playbook as root

```sudo ansible-playbook -i inventory/localhost.yml playbook_mining.yml```

# Code License

All code is licensed under the Apache 2 License (http://www.apache.org/licenses/LICENSE-2.0)

# Non-Code License

All non-code Assets, documentation, etc is licensed under the Creative Commons Attribution-ShareAlike 3.0 license (https://creativecommons.org/licenses/by-sa/3.0/us/)
