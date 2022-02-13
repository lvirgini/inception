#!/bin/bash

# get .env for DOMAIN_NAME
source ./srcs/.env

#  make HOSTNAME for add it in /hosts
HOST_NAME="127.0.0.1 ${DOMAIN_NAME}"

echo "setup domain_name"
# if grep return 0 : find : we don't have to setup again
if !(grep -q "$HOST_NAME" /etc/hosts)
then
    sudo echo "$HOST_NAME" >> /etc/hosts
fi

echo "setup volumes"
echo $USER
mkdir -p "/home/$USER/data/wordpress"
mkdir -p "/home/$USER/data/db"

