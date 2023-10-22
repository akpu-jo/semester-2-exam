# #!/bin/bash

# # Installimg Ansible on slave machine
sudo apt update
sudo apt -y install software-properties-common
# sudo add-apt-repository --yes ppa:ansible/ansible
sudo apt-add-repository --yes ppa:ansible/ansible
sudo apt -y install ansible
