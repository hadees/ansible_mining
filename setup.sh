#!/bin/bash

# Add ansible and install
sudo add-apt-repository --yes ppa:ansible/ansible
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install ansible

# Clone Ansible mining setup
sudo git clone https://github.com/mcrosson/ansible_mining.git /ansible_mining
sudo chmod 777 /ansible_mining
sudo ansible-playbook -i /ansible_mining/inventory/localhost.yml /ansible_mining/playbook_mining.yml

# Run any mining that didn't auto-start via Ansible
sudo systemctl start sc-marlin
