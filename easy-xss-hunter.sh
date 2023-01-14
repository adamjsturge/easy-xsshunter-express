#!/bin/bash

read -p "Do you want to install Docker? (y/n) " choice

while true; do
    read -p "Do you want to proceed? (y/n) " yn
    case $yn in 
        [yY] )
            curl -fsSL get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            break;;
        [nN] );;
        * ) echo invalid response;;
    esac
done

options=("Official Repo (https://github.com/mandatoryprogrammer/xsshunter-express)" "Slack Notification Fork (https://github.com/adamjsturge/xsshunter-express)")
PS3='Which Github option would you like to choose? '
select opt in "${options[@]}"
do
    case $opt in
        "Official Repo (https://github.com/mandatoryprogrammer/xsshunter-express)")
            git clone https://github.com/mandatoryprogrammer/xsshunter-express.git
            break
            ;;
        "Slack Notification Fork (https://github.com/adamjsturge/xsshunter-express)")
            git clone https://github.com/adamjsturge/xsshunter-express.git
            break
            ;;
        *) echo "Invalid option. Please select again.";;
    esac
done

cd xsshunter-express