#!/bin/bash
# sudo wget --inet4-only -O- https://raw.githubusercontent.com/vsimplantacao/vsimplantacao/main/UpdateManiaInterface.sh | bash
log() 
{
    echo $(date)
    rm ~/update-status.txt
    echo "$1" > ~/update-status.txt
}

# Versions
VsOsInterface="2.28.0"

# Output
killall chrome
wget --inet4-only -c https://images.food.vsd.app/uploads/10075/advertising/2024/05/09/8645317ab77b45f7.gif
google-chrome --password-store=basic --kiosk --disable-pinch 8645317ab77b45f7.gif &>/dev/null &

# Prepare
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/lib/dpkg/lock
sudo ufw disable

log "Parando serviços..."
# Stop all services
killall node

# Backups
log "Criando Backups..."
sudo mkdir -p /opt/videosoft_bkp_log/vs-os-interface/

sudo mv /opt/videosoft/vs-autopag-se/log/ /opt/videosoft_bkp_log/vs-autopag-se/

# Error apport Ubuntu remove
sudo rm /var/crash/*
sudo apt remove apport apport-symptoms -y

# Download packages
log "Download VS OS Interface...."
wget --inet4-only -c https://cdn.vsd.app/softwares/vs-os-interface/$VsOsInterface/vs-os-interface_$VsOsInterface'_amd64.deb'

# Install packages
log "Instalando VS OS Interface...."
sudo dpkg -i vs-os-interface_$VsOsInterface'_amd64.deb'

log "Restaurando Backups...."
# Restaurar Backups
# Em Construção

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
