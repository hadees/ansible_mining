#!/bin/bash

env # Handy for debugging cloud deployments

# Add ansible and install
sudo add-apt-repository --yes ppa:ansible/ansible
sudo apt-get --assume-yes update
sudo apt-get --assume-yes install ansible

# Clone Ansible mining setup
sudo git clone https://github.com/mcrosson/ansible_mining.git /ansible_mining
sudo chmod 777 /ansible_mining
sudo ansible-playbook -i /ansible_mining/inventory/localhost.yml /ansible_mining/playbook_mining.yml

# Run any mining that didn't auto-start via Ansible
if [ "${SC_MARLIN}" = true ]; then
    sudo systemctl start sc-marlin
fi
if [ "${LBRY_CCMINER_ALT}"  = true ]; then
    sudo systemctl start lbry-ccminer-alt
fi
if [ "${XMR_XDN_CCMINER_CRYPTONIGHT}" = true ]; then
    sudo systemctl start xmr-xdn-ccminer-cryptonight
fi
if [ "${SC_CCMINER}" = true ]; then
    sudo systemctl start sc-ccminer
fi
if [ "${ETH_SIA_CLAYMORE}" = true ]; then
    sudo systemctl start eth-sia-claymore
fi
if [ "${MUSIC_SC_CLAYMORE}" = true ]; then
    sudo systemctl start music-sc-claymore
fi
if [ "${ZEC_EBWF}" = true ]; then
    sudo systemctl start zec-ebwf
fi
if [ "${BCN_XMR_MINERGATE}" = true ]; then
    sudo systemctl start bcn-xmr-minergate
fi
