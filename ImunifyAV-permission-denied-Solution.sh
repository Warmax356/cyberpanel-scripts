#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

echo -e $TEXT_YELLOW
echo 'This script will update, upgrade your Ubuntu server and fix ImunifyAV permission'
echo -e $TEXT_RESET

sudo apt update
echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET

sudo apt upgrade -y
echo -e $TEXT_YELLOW
echo 'APT upgrade finished...'
echo -e $TEXT_RESET

sudo apt dist-upgrade
echo -e $TEXT_YELLOW
echo 'APT distributive upgrade finished...'
echo -e $TEXT_RESET

sudo apt autoclean -y
echo -e $TEXT_YELLOW
echo 'APT auto clean finished...'
echo -e $TEXT_RESET

sudo apt autoremove -y
echo -e $TEXT_YELLOW
echo 'APT auto remove finished...'
echo -e $TEXT_RESET

chmod +x /usr/local/CyberCP/public/imunifyav/classes/panels/../../bin/execute.py
echo -e $TEXT_YELLOW
echo 'ImunifyAV permission Given.'
echo 'Please restart server if needed and check if problem solved.'
echo -e $TEXT_RESET

if [ -f /var/run/reboot-required ]; then
    echo -e $TEXT_RED_B
    echo 'Reboot required!'
    echo -e $TEXT_RESET

    echo -e $TEXT_YELLOW
    read -r -p "Do you want to reboot now? [Y/n]" response
    response=${response,,}
    echo -e $TEXT_RESET

    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
       sudo reboot
    fi
fi