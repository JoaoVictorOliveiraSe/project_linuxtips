#!/bin/bash
sudo apt update -y
git clone https://github.com/JoaoVictorOliveiraSe/linuxtips_ansible.git
sudo apt install ansible -y
cd linuxtips_ansible
ansible-playbook -i hosts wordpress.yml