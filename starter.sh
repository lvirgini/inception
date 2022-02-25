#!/bin/bash

export LOGIN=lvirgini

# get .env for DOMAIN_NAME
source ./srcs/.env

#  make HOSTNAME for add it in /hosts
HOST_NAME="127.0.0.1 ${DOMAIN_NAME}"
VOLUME_PATH="/home/$LOGIN/data"


echo "setup domain_name : ${DOMAIN_NAME}"
if !(grep -q "$HOST_NAME" /etc/hosts)
then
    sudo sh -c "echo $HOST_NAME >> /etc/hosts"
fi


echo "setup volumes in : $VOLUME_PATH/"
sudo mkdir -p "$VOLUME_PATH/wordpress"
sudo mkdir -p "$VOLUME_PATH/db"
