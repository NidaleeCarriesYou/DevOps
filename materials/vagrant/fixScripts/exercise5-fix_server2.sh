#!/bin/bash
#add fix to exercise5-server2 here
echo "192.168.60.11 server2" >> /etc/hosts
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config
sudo passwd -d vagrant
sudo systemctl restart sshd.service
