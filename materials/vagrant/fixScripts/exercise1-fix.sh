#!/bin/bash
#add fix to exercise1 here
echo "
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]" >> /etc/netplan/50-vagrant.yaml

sudo netplan apply    
