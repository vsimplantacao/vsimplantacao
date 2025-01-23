#!/bin/bash
# sudo wget --inet4-only -O- https://raw.githubusercontent.com/vsimplantacao/vsimplantacao/main/updateIfood.sh | bash

log() 
{
    echo $(date)
    rm ~/update-status.txt
    echo "$1" > ~/update-status.txt
}

# Versions
VsOsInterface="2.24.0"

# Prepare
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/lib/dpkg/lock
sudo ufw disable
wget https://raw.githubusercontent.com/wilker-santos/VSDImplantUpdater/main/vsd-launcher.sh -O vsd-launcher 
log "Removendo Vs Print...."
sudo apt purge vs-print 
log "Removendo Vs Autopag...."
sudo apt purge vs-autopag-se

log "Parando serviços..."
killall node
sudo chmod 755 vsd-launcher
sudo mv vsd-launcher /usr/bin/
vsd-launcher -s food
vsd-launcher --clear-token

# Backups
log "Criando Backups..."
sudo mkdir -p /opt/videosoft_bkp_log/vs-os-interface/

# Install packages
log "Instalando VS OS Interface...."
sudo dpkg -i vs-os-interface_$VsOsInterface'_amd64.deb'


log "Instalação Concluida"
echo "*****************Instalação Concluida*************************"
log "Reiniciando...."
echo "Reiniciando Terminal em 5..."
sleep 1
echo "Reiniciando Terminal em 4..."
sleep 1
echo "Reiniciando Terminal em 3..."
sleep 1
echo "Reiniciando Terminal em 2..."
sleep 1
echo "Reiniciando Terminal em 1..."
sleep 1
echo "Reiniciando Terminal em 0..."
sleep 1
reboot
EOF
