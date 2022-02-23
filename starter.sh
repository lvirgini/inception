#!/bin/bash

# get .env for DOMAIN_NAME
source ./srcs/.env

#  make HOSTNAME for add it in /hosts
HOST_NAME="127.0.0.1 ${DOMAIN_NAME}"
VOLUME_PATH="/home/$USER/data"

echo "setup domain_name : ${DOMAIN_NAME}"
# if grep return 0 : find : we don't have to setup again
if !(grep -q "$HOST_NAME" /etc/hosts)
then
    sudo sh -c "echo $HOST_NAME >> /etc/hosts"
fi

echo "setup volumes in : $VOLUME_PATH/"
mkdir -p "$VOLUME_PATH/wordpress"
mkdir -p "$VOLUME_PATH/db"

