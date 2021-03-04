#!/bin/bash

# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
   echo 'Please run with sudo or as root.' >&2
   exit 1
fi

ufw --force enable

sudo ufw default deny outgoing comment 'deny all outgoing traffic'

sudo ufw default deny incoming comment 'deny all incoming traffic'

sudo ufw limit in 22 comment 'allow ssh connections in'

sudo ufw allow out 22 comment 'allow ssh out'

sudo ufw limit in 2277 comment 'allow ssh connections in on port 2277'

sudo ufw allow out 2277 comment 'allow ssh connections out on port 2277'

sudo ufw limit in 60000:60020/udp comment 'mosh limit in '

sudo ufw allow out 60000:60020/udp comment 'mosh out'

sudo ufw allow out 53 comment 'allow dns'

sudo ufw allow out 443 comment 'allow ssl'

#sudo ufw allow out 123 comment 'allow ntp'

sudo ufw allow out http comment 'allow http traffic'

sudo ufw allow out 9050 comment 'allow tor'

sudo ufw allow out 9051 comment 'tor control port'

sudo ufw allow out 43 comment 'allow whois'

# write rule just like this for wireguard
sudo ufw allow 51820/udp comment 'allow wireguard'

#sudo ufw allow openvpn comment 'allow opnvpn'

#sudo ufw allow out on tun0

#echo "yes" | ufw enable

sudo sed -i "s/IPV6=yes/IPV6=no/" /etc/default/ufw

#reload firewall after making changes
ufw reload








