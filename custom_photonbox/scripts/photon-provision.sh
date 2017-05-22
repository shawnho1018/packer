#!/bin/bash

HOME_DIR="/home/vagrant"

# Set up a vagrant user and add the insecure key for Vagrant to login
useradd -g 100 -m vagrant

# Configure a sudoers for the vagrant user
echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vagrant

# Add ssh vagrant key
mkdir -p ${HOME_DIR}/.ssh
# Apply vagrant shipped public key (the private key is also shipping from ./vagrant.d/insecure_private_key)
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > ${HOME_DIR}/.ssh/authorized_keys
chown -R vagrant:users ${HOME_DIR}/.ssh
chmod 700 ${HOME_DIR}/.ssh
chmod 600 ${HOME_DIR}/.ssh/authorized_keys
# Disable Root and Password Login
# sed -i -e 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
# sed -i -e "\\#PasswordAuthentication yes# s#PasswordAuthentication yes#PasswordAuthentication no#g" /etc/ssh/sshd_config
# sudo service ssh restart  
# Temporary upgrade docker to 1.12
#tdnf -y install --refresh docker
# Since Photon OS uses systemd, we must prep for cloning
echo -n > /etc/machine-id
