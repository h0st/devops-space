#!/bin/bash

sudo timedatectl set-timezone Europe/Moscow

sudo dnf install -y chrony

sudo systemctl start chronyd
sudo systemctl status chronyd
sudo systemctl enable --now chronyd

sudo echo 'server 192.168.56.10/24' >> /etc/chrony.conf

sudo systemctl restart chronyd

#sudo firewall-cmd --permanent --add-service=ntp
#sudo firewall-cmd --reload

sudo chronyc sources 
sudo chronyc clients

