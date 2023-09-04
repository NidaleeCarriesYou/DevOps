#!/bin/bash
#add fix to exercise3 here
cd /etc/apache2/sites-available
sed -i "s/denied/granted/g" 000-default.conf
sudo systemctl restart apache2.service
