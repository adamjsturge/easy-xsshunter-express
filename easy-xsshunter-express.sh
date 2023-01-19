#!/bin/bash

while true; do
    read -p "Do you want to install Docker? (y/n) " yn
    case $yn in 
        [yY] )
            curl -fsSL get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            break;;
        [nN] )break;;
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
        "Discord/Slack Notification Fork (https://github.com/adamjsturge/xsshunter-express)")
        ADAM_FORK=true
            git clone https://github.com/adamjsturge/xsshunter-express.git
            break
            ;;
        *) echo "Invalid option. Please select again.";;
    esac
done

cd xsshunter-express/

read -p "Do you want to go through basic setup? (y/n) " yn
case $yn in 
    [yY] )
        echo "Leave anything blank you don't know or don't want to change"
        ;;
    [nN] )
        echo "Setup skipped. Please refrence the README.md in xsshunter-express on how to setup"
        exit
        ;;
    * ) echo invalid response;;
esac

read -p "What is your hostname? " HOSTNAME
if [ -n "$HOSTNAME" ]; then
    sed -i "s/HOSTNAME=your.host.name/HOSTNAME=$HOSTNAME/" docker-compose.yml
fi

read -p "What is your SSL contact email? " SSL_CONTACT_EMAIL
if [ -n "$SSL_CONTACT_EMAIL" ]; then
    sed -i "s/SSL_CONTACT_EMAIL=YourEmail@gmail.com/SSL_CONTACT_EMAIL=$SSL_CONTACT_EMAIL/" docker-compose.yml
fi

read -p "Do you want to enable SMTP email notifications? (y/n) " SMTP_EMAIL_NOTIFICATIONS_ENABLED
if [[ "$SMTP_EMAIL_NOTIFICATIONS_ENABLED" =~ [Yy] ]]; then
    sed -i "s/SMTP_EMAIL_NOTIFICATIONS_ENABLED=false/SMTP_EMAIL_NOTIFICATIONS_ENABLED=true/" docker-compose.yml
    read -p "What is your SMTP host? " SMTP_HOST
    if [ -n "$SMTP_HOST" ]; then
        sed -i "s/SMTP_HOST=smtp.gmail.com/SMTP_HOST=$SMTP_HOST/" docker-compose.yml
    fi

    read -p "What is your SMTP port (default 465)? " SMTP_PORT
    if [ -n "$SMTP_PORT" ]; then
        sed -i "s/SMTP_PORT=465/SMTP_PORT=$SMTP_PORT/" docker-compose.yml
    fi

    read -p "Do you want to enable SMTP use TLS? (y/n) " SMTP_USE_TLS
    if [[ "$SMTP_USE_TLS" =~ [Yy] ]]; then
        sed -i "s/SMTP_USE_TLS=false/SMTP_USE_TLS=true/" docker-compose.yml
    else
        sed -i "s/SMTP_USE_TLS=true/SMTP_USE_TLS=false/" docker-compose.yml
    fi

    read -p "What is your SMTP username? " SMTP_USERNAME
    if [ -n "$SMTP_USERNAME" ]; then
        sed -i "s/SMTP_USERNAME=YourEmail@gmail.com/SMTP_USERNAME=$SMTP_USERNAME/" docker-compose.yml
    fi

    read -p "What is your SMTP password? " SMTP_PASSWORD
    if [ -n "$SMTP_PASSWORD" ]; then
        sed -i "s/SMTP_PASSWORD=YourEmailPassword/SMTP_PASSWORD=$SMTP_PASSWORD/" docker-compose.yml
    fi

    read -p "What is your SMTP from email? " SMTP_FROM_EMAIL
    if [ -n "$SMTP_FROM_EMAIL" ]; then
        sed -i "s/SMTP_FROM_EMAIL=YourEmail@gmail.com/SMTP_FROM_EMAIL=$SMTP_FROM_EMAIL/" docker-compose.yml
    fi

    read -p "What is your SMTP receiver email? " SMTP_RECEIVER_EMAIL
    if [ -n "$SMTP_RECEIVER_EMAIL" ]; then
        sed -i "s/SMTP_RECEIVER_EMAIL=YourEmail@gmail.com/SMTP_RECEIVER_EMAIL=$SMTP_RECEIVER_EMAIL/" docker-compose.yml
    fi
else
    sed -i "s/SMTP_EMAIL_NOTIFICATIONS_ENABLED=true/SMTP_EMAIL_NOTIFICATIONS_ENABLED=false/" docker-compose.yml
fi

if [ -n "$ADAM_FORK" ]; then
    read -p "Do you want to enable Slack notifications? (y/n) " SLACK_NOTIFICATIONS_ENABLED
    if [[ "$SLACK_NOTIFICATIONS_ENABLED" =~ [Yy] ]]; then
        sed -i "s/SLACK_NOTIFICATIONS_ENABLED=false/SLACK_NOTIFICATIONS_ENABLED=true/" docker-compose.yml
        read -p "What is your Slack webhook (Include https://)? " SLACK_WEBHOOK
        if [ -n "$SLACK_WEBHOOK" ]; then
            sed -i "s|SLACK_WEBHOOK=hooks.slack.com/services/|SLACK_WEBHOOK=$SLACK_WEBHOOK/" docker-compose.yml
        fi

        read -p "What is your Slack channel? " SLACK_CHANNEL
        if [ -n "$SLACK_CHANNEL" ]; then
            sed -i "s/SLACK_CHANNEL=xssalerting/SLACK_CHANNEL=$SLACK_CHANNEL/" docker-compose.yml
        fi

        read -p "What is your Slack username? " SLACK_USERNAME
        if [ -n "$SLACK_USERNAME" ]; then
            sed -i "s/SLACK_USERNAME=XSS-Hunter/SLACK_USERNAME=$SLACK_USERNAME/" docker-compose.yml
        fi

        read -p "What is your Slack emoji? " SLACK_EMOJI
        if [ -n "$SLACK_EMOJI" ]; then
            sed -i "s/SLACK_EMOJI=hackerman/SLACK_EMOJI=$SLACK_EMOJI/" docker-compose.yml
        fi
    else
        sed -i "s/SLACK_NOTIFICATIONS_ENABLED=true/SLACK_NOTIFICATIONS_ENABLED=false/" docker-compose.yml
    fi
    read -p "Do you want to enable Discord notifications? (y/n) " DISCORD_NOTIFICATIONS_ENABLED
    if [[ "$DISCORD_NOTIFICATIONS_ENABLED" =~ [Yy] ]]; then
        sed -i "s/DISCORD_NOTIFICATIONS_ENABLED=false/DISCORD_NOTIFICATIONS_ENABLED=true/" docker-compose.yml
        read -p "What is your Discord webhook (Include https://)? " DISCORD_WEBHOOK
        if [ -n "$DISCORD_WEBHOOK" ]; then
            sed -i "s|DISCORD_WEBHOOK=discord.com/api/webhooks/|DISCORD_WEBHOOK=$DISCORD_WEBHOOK/" docker-compose.yml
        fi
    else
        sed -i "s/DISCORD_NOTIFICATIONS_ENABLED=true/DISCORD_NOTIFICATIONS_ENABLED=false/" docker-compose.yml
    fi
fi

echo "You should be able to start xsshunter-express with (docker compose up -d postgresdb && docker compose up xsshunterexpress)"
echo "Please reference the README.md of xsshunter-express if you need further setup"