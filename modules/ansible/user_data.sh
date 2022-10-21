#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo apt-get install software-properties-common -y
sudo apt-get update -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y
sudo chmod 400 /home/ubuntu/test-key
sudo mkdir /etc/ansible 
sudo touch /etc/ansible/hosts
sudo chown ubuntu:ubuntu /etc/ansible/hosts
sudo bash -c ' echo "StrictHostKeyChecking No" >> /etc/ssh/ssh_config'
sudo echo "[Main-Master]" >> /etc/ansible/hosts
sudo echo "${Master_IP1} ansible_ssh_private_key_file=/home/ubuntu/test-key" >> /etc/ansible/hosts
sudo echo "[Member-Masters]" >> /etc/ansible/hosts
sudo echo "${Master_IP2} ansible_ssh_private_key_file=/home/ubuntu/test-key" >> /etc/ansible/hosts
sudo echo "${Master_IP3} ansible_ssh_private_key_file=/home/ubuntu/test-key" >> /etc/ansible/hosts
sudo echo "[Workers]" >> /etc/ansible/hosts
sudo echo "${Worker1} ansible_ssh_private_key_file=/home/ubuntu/test-key" >> /etc/ansible/hosts
sudo echo "${Worker2} ansible_ssh_private_key_file=/home/ubuntu/test-key" >> /etc/ansible/hosts
sudo echo "${Worker3} ansible_ssh_private_key_file=/home/ubuntu/test-key" >> /etc/ansible/hosts
sudo echo "${Worker4} ansible_ssh_private_key_file=/home/ubuntu/test-key" >> /etc/ansible/hosts
sudo echo "[HA-lb]" >> /etc/ansible/hosts
sudo echo "${HA-lb-PubIP} ansible_ssh_private_key_file=/home/ubuntu/test-key" >> /etc/ansible/hosts
sudo touch /etc/ansible/ha-ip.yml
sudo chmod -R 777 /etc/ansible/ha-ip.yml
sudo echo ha_prv_ip: "${HA-lb-PrvIP}" >> /etc/ansible/ha-ip.yml
sudo su -c 'ansible -m ping all' ubuntu
sudo su -c 'ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/user.yml' ubuntu
sudo su -c 'ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/installation.yml' ubuntu
sudo su -c 'ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/main-master.yml' ubuntu
sudo su -c 'ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/member-master.yml' ubuntu
sudo su -c 'ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/join-workers.yml' ubuntu
sudo su -c 'ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/HA-lb.yml' ubuntu
sudo su -c 'ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/deployment.yml' ubuntu
sudo su -c 'ansible-playbook -i /etc/ansible/hosts /home/ubuntu/playbooks/monitoring.yml' ubuntu