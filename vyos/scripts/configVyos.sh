#!/bin/vbash
source /opt/vyatta/etc/functions/script-template
configure
### Add public key to Vyos
loadkey vyos /home/vyos/.ssh/authorized_keys
#delete interfaces ethernet eth0
#commit
#set interfaces ethernet eth0 address 192.168.62.10/24
#commit
#save
#set system login user root authentication plaintext-password vyos
#set service ssh allow-root<enter>

### Measures to solve open-vm-tools HGFS issue but useless
#mkdir /mnt/hgfs<enter>
#echo 'answer AUTO_KMODS_ENABLED yes' | sudo tee -a /etc/vmware-tools/locations

### Delete eth0 hw-id to prevent cloned VM's eth0 being replaced with eth1
delete interfaces ethernet eth0 hw-id
#delete interfaces ethernet eth1 hw-id
commit
save
exit
