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
if [[ -z "${SC_MARLIN}" ]]; then
    sudo systemctl start sc-marlin
fi
if [[ -z "${LBRY_CCMINER_ALT}" ]]; then
    sudo systemctl start lbry-ccminer-alt
fi
if [[ -z "${XMR_XDN_CCMINER_CRYPTONIGHT}" ]]; then
    sudo systemctl start xmr-xdn-ccminer-cryptonight
fi
if [[ -z "${SC_CCMINER}" ]]; then
    sudo systemctl start sc-ccminer
fi
if [[ -z "${ETH_SIA_CLAYMORE}" ]]; then
    sudo systemctl start eth-sia-claymore
fi
if [[ -z "${MUSIC_SC_CLAYMORE}" ]]; then
    sudo systemctl start music-sc-claymore
fi
if [[ -z "${ZEC_EBWF}" ]]; then
    sudo systemctl start zec-ebwf
fi
if [[ -z "${BCN_XMR_MINERGATE}" ]]; then
    sudo systemctl start bcn-xmr-minergate
fi
